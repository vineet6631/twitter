var bcrypt=require('bcryptjs');
const { general_res } = require('../helpers/general_res');
const { con } = require('../config/db_connect');


const set_password=async (req,res)=>{
    console.log("in set password");
    let b=req.body
     console.log(b);
     const hash = bcrypt.hashSync(b.password, 10);
     let query = 'select is_verified from user_data where user_id = ?'
     let promise1 = await con.promise().query(query,[b.user_id])
     let promise1_query_result = promise1[0]
     console.log('promise1 result:',promise1_query_result);

     if(promise1_query_result[0].is_verified){
      console.log('password is already set');
      general_res({success:false},"link is already used",res)
     }else{
      let sql=`UPDATE user_data SET password = '${hash}', is_verified=1 WHERE user_id = ${b.user_id}`
     con.query(sql,(err,result)=>{
       if(err){
          console.log(err);
       }
       else{
          console.log(result);
          general_res({success:true},"being sent to login page",res)
       }
     })
     }
     

     
     
 }
 module.exports={set_password}