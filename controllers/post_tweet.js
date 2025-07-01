const { con } = require("../config/db_connect");
const { general_res } = require("../helpers/general_res");

const post_tweet=(req,res)=>{
    let b=req.body
    let q=req.query
    console.log(q.user_id);
    console.log("in post tweet",b);
    con.query(`INSERT INTO tweet_records ( tweet_string, user_id) VALUES ('${b.tweet_text}', '${q.user_id}')`,(err,result)=>{
       if(err){console.log(err);
       }
       else{
          general_res({success:true},"tweeted successfully",res)
       }
    })
 }
 module.exports={post_tweet}