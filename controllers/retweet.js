const { con } = require("../config/db_connect");
const { general_res } = require("../helpers/general_res");

const retweet=(req,res)=>{
    let q=req.query
    let user_id=q.user_id
    let tweet_id=q.tweet_id
    console.log(user_id);
    console.log("twthhh",tweet_id);
    con.query(`INSERT INTO retweet_records (tweet_id, retweet_user_id, retweet_string) VALUES ( ${tweet_id}, '${user_id}', 'hello this is retweet ${user_id}')`,(err,result)=>{
       if(err){
          console.log(err);
       }
       else{
          general_res({success:true},"retweet successfull",res)
       }
    })
 }
 module.exports={retweet}