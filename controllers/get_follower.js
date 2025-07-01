const { con } = require("../config/db_connect");
const { general_res } = require("../helpers/general_res");

const get_follower=(req,res)=>{
    let user_id=req.query.cur_user_id
 
    con.query(`select * FROM user_data where is_verified=1 and user_id in(select user_id FROM follow_relations WHERE following=${user_id} and is_true=1)  `,(err,follower)=>{
       if(err){
          console.log(err);
       }
       else{
          con.query(`select following from follow_relations where user_id=${user_id} and is_true=1`,(err,result)=>{ 
             const following=[];
             for(let i=0;i<result.length;i++){
              following.push(result[i].following)
             }
          console.log(following);
          general_res({success:true,data_obj:follower,data_obj2:following},"fetching followings",res)
          })
          
       }
    })
 }
 module.exports={get_follower}