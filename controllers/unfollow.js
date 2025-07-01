const { con } = require("../config/db_connect");
const { general_res } = require("../helpers/general_res");

const unfollow=(req,res)=>{
    let q=req.query
    var cur_user_id=q.cur_user_id;
    var following_user_id=q.following_user_id;
      console.log(q);
    
      con.query(`update follow_relations set is_true=0 where following=${following_user_id} and user_id=${cur_user_id}`,(err,result)=>{
         if(err){
          console.log(err);
         }
         else{
          general_res({success:true},"unfollow success",res)
         }
      }) 
 }
 module.exports={unfollow}