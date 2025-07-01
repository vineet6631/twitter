const JWT=require('jsonwebtoken')
const { con } = require("../config/db_connect")
const { general_res } = require("../helpers/general_res")
require('dotenv').config()
const check_user_status=(req,res,next)=>{
    let b=req.body
    let email=b.email
    con.query(`select * from user_data where email='${email}'`,(err,result,field)=>{
       if(err){
        console.log(err);
       }
       else if(result.length >0){
        console.log(result);
        
            if(!result[0].is_verified){
                let user_id=result[0].user_id
                let token=JWT.sign({
                            user_id: user_id,
                            firstname: b.firstname,
                            lastname: b.lastname,
                            email: b.email
                          }, process.env.SECRET_KEY);
              general_res({success:true,user_id:user_id,token:token},"already registred sending email for verification",res)
            }
            else{
                next()
               }
       }
       else{
        next()
       }
       
    })
}
module.exports={check_user_status}