const { con } = require("../config/db_connect");
const { general_res } = require("../helpers/general_res");

const get_suggestions=(req,res)=>{
    console.log("in suggestion");
    console.log(req.query);
    const cur_user_id=req.query.cur_user_id
    const following=[];

   con.query(`select * from user_data where user_id !=${cur_user_id} and is_verified=1 and user_id not in (select following from follow_relations where user_id=${cur_user_id} and is_true=1) `,(err,result1)=>{
    if(err){
     console.log(err);
    }
    else{
       general_res({success:true,data_obj:result1},"fetching suggestions and follow data",res)
      }    
   })     
}

module.exports={get_suggestions}