const { con } = require("../config/db_connect");
const { general_res } = require("../helpers/general_res");

const get_self_profile=(req,res)=>{
    let user_id=req.query.user_id
    console.log(user_id);
     con.query(`select * from follow_relations where user_id=${user_id} and is_true=1`,(err,followings)=>{
       if(err){console.log(err);
       }
       else{
       console.log("followers",followings);
       con.query(`select * from follow_relations where following=${user_id} and is_true=1`,(err,followers)=>{
         if(err){console.log(err);
         }
         else{
          console.log("followers",followers);
          con.query(`select tweet_id,tweet_string,(SELECT user_data.email FROM user_data WHERE user_data.user_id=tweet_records.user_id) as tweet_user,null as retweet_user,null as retweet_string,likes, 0 as is_retweet,tweet_time as time from tweet_records where tweet_records.user_id=${user_id} UNION SELECT retweet_records.retweet_id,tweet_records.tweet_string,(SELECT user_data.email FROM user_data WHERE user_data.user_id=tweet_records.user_id) as tweet_user,(SELECT user_data.email FROM user_data WHERE user_data.user_id=retweet_records.retweet_user_id) as retweet_user,retweet_records.retweet_string,retweet_records.likes,1 as is_retweet,retweet_records.retweet_time from retweet_records join tweet_records on retweet_records.tweet_id=tweet_records.tweet_id where retweet_records.retweet_user_id=${user_id} ORDER by time DESC `,(err,all_records)=>{
             if(err){
                console.log(err);
             }
             else{
                con.query(`select tweet_id from likes where user_id=${user_id}`,(err,result)=>{
                   if(err){
                      console.log(err);
                   }
                   else{
                     
                   const tweets_liked=[];
                   for(let i=0;i<result.length;i++){
                    tweets_liked.push(result[i].tweet_id)
                   }
       
                   con.query(`select retweet_id from retweet_likes where user_id=${user_id}`,(err,retweets)=>{
                      const retweets_liked=[];
                            if(err){
                               console.log(err);
                            }
                            else{
                               console.log(retweets);
                               
                               for(let i=0;i<retweets.length;i++){
                                  retweets_liked.push(retweets[i].retweet_id)
                                 }
                            }
                            console.log("tweet",tweets_liked);
                            console.log("retweet",retweets_liked);
       
                            
                            general_res({success:true,data_obj:all_records,data_obj2:tweets_liked,data_obj3:retweets_liked,data_obj4:followings,data_obj5:followers},"fetching tweets",res)
                      })
                   }
                })
                
             }
          })
         }
         }) 
       }
     })
    
 }


 module.exports={get_self_profile}