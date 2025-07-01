var bcrypt=require('bcryptjs');
var JWT=require('jsonwebtoken')
const { con } = require('../config/db_connect');
const { general_res } = require('../helpers/general_res');
require('dotenv').config()
const login=(req,res)=>{
    console.log(req.body);
    let b=req.body;
    con.query(`select * from user_data where email='${b.email}'`,async(err,results)=>{
       if(err){
          console.log(err);
          general_res({success:false},"incorrect email or password",res)
       }
       else if(results[0]){
        let verified= await bcrypt.compare(b.password,results[0].password);
        console.log(verified);
        if(verified){
          const token = JWT.sign({
             user_id: results[0].user_id,
             firstname: results[0].firstname,
             lastname: results[0].lastname,
             email: results[0].email
           }, "VINEET");
           console.log(token);
          //  res.send({ data:{success:true, token:token },
          //            message:"login sucess"
          //          })
          general_res({success:true, token:token ,user_id:results[0].user_id,firstname:results[0].firstname},"login sucess",res)
                }
                else{
                   // res.send({ data:{success:false},
                   //    message:"incorrect email or password"
                   //            })
                   general_res({success:false},"incorrect email or password",res)
                    }
       }
       else{
          // res.send({ data:{success:false},
          //    message:"incorrect email or password"})
          general_res({success:false},"incorrect email or password",res)       
          }
 
    })
 }
 module.exports={login}