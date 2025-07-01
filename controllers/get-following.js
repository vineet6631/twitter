const { con } = require("../config/db_connect");
const { general_res } = require("../helpers/general_res");

const get_following=(req,res)=>{
    let user_id=req.query.cur_user_id
    console.log("in following",user_id);
    con.query(`select * from (select * from follow_relations WHERE is_true=1 AND user_id=${user_id}) AS b join (select * from user_data where is_verified=1) as a on b.following=a.user_id `,(err,followings)=>{
       if(err){
          console.log(err);
       }
       else{
          console.log(followings);
          general_res({success:true,data_obj:followings},"fetching followings",res)
          
       }
    })
    
 }

 module.exports={get_following}