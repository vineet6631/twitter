const { con } = require("../config/db_connect");
const { general_res } = require("../helpers/general_res");

const follow=(req,res)=>{
    let q=req.query
    var cur_user_id=q.cur_user_id;
    var following_user_id=q.following_user_id;
      console.log(q);
    
      con.query(`INSERT INTO follow_relations( user_id, following) VALUES ('${cur_user_id}','${following_user_id}')`,(err,result)=>{
         if(err){
          console.log(err);
         }
         else{
          general_res({success:true},"follow success",res)
         }
      })  
 }
 module.exports={follow}