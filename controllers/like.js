const { con } = require("../config/db_connect")
const { general_res } = require("../helpers/general_res")

const like=(req,res)=>{
    let q=req.query
    let user_id=q.user_id
    let type=q.type
    let tweet_id=q.tweet_id
    console.log(user_id);
    console.log("twt",tweet_id);
    if(type=='tweet'){
    con.query(`update tweet_records set likes=likes+1 where tweet_id=${tweet_id}`,(err,result)=>{
       if(err){
          console.log(err);
       }
       else{
          con.query(`INSERT INTO likes ( tweet_id, user_id) VALUES ('${tweet_id}','${user_id}') `,(err,result)=>{
             if(err){
                console.log(err);
             }
             else{
                general_res({success:true},"like successfull",res)
             }
          })
       }
    })
   }
   else if(type=='retweet'){
    con.query(`update retweet_records set likes=likes+1 where retweet_id=${tweet_id}`,(err,result)=>{
       if(err){
          console.log(err);
       }
       else{
          con.query(`INSERT INTO retweet_likes ( retweet_id, user_id) VALUES ('${tweet_id}','${user_id}') `,(err,result)=>{
             if(err){
                console.log(err);
             }
             else{
                general_res({success:true},"retweet like successfull",res)
             }
          })
       }
    })
   }
    
 }
 module.exports={like}