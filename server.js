var express=require('express');
var bodyparser=require('body-parser');
var multer=require('multer')
var app= express();
app.use(bodyparser.json());
app.set('view engine','ejs');
var joi=require('joi')
var bcrypt=require('bcryptjs');


const { con } = require("./config/db_connect");
const { signup } = require('./controllers/signup');
const { auth_token } = require('./middleware/auth');
const { general_res } = require('./helpers/general_res');
const Joi = require('joi');
const { schema_validation, pass_schema_validation } = require('./middleware/schema_validation');
const { check_user_status } = require('./middleware/check_for_verification');
const { login } = require('./controllers/login');
const { set_password } = require('./controllers/set_password');
const { retweet } = require('./controllers/retweet');
const { unlike } = require('./controllers/unlike');
const { like } = require('./controllers/like');
const { post_tweet } = require('./controllers/post_tweet');
const { get_dashboard } = require('./controllers/get_dashboard');
const { get_follower } = require('./controllers/get_follower');
const { get_following } = require('./controllers/get-following');
const { get_self_profile } = require('./controllers/get_self_profile');
const { follow } = require('./controllers/follow');
const { unfollow } = require('./controllers/unfollow');
const { get_suggestions } = require('./controllers/get_suggestions');
const { get_profile } = require('./controllers/get-profile');
const upload = multer()

con.connect((err)=>{
    if(err) throw err
    console.log("database connected");   
 })

app.get('/',(req,res)=>{
    res.render('signup')
 })

app.get('/virtual-email',(req,res)=>{
  res.render('virtual_mail')
})
app.get('/check-valid',auth_token,(req,res)=>{  
   general_res({success:true},"going forn password set",res) 
})
app.get('/render-set-password',(req,res)=>{
     res.render('set-password')
})
app.get('/render-loginpage',(req,res)=>{
   res.render('login')
})
app.get('/render-dashboard',(req,res)=>{
   res.render('dashboard')
})
app.get('/render-get-suggestions',(req,res)=>{
   res.render('suggestions')
})
app.get('/render-get-selfprofile',(req,res)=>{
   res.render('self-profile')
})
app.get('/render-following',(req,res)=>{
   res.render('following')
})
app.get('/render-follower',(req,res)=>{
   res.render('follower')
})
app.get('/render-post-tweet',(req,res)=>{
   res.render('post_tweet')
})
app.get('/render-followed-tweets',(req,res)=>{
   res.send('THIS PAGEEE IS UNDER PROCESSING....!')
})
app.get('/render-profile',(req,res)=>{
   res.render('profile')
})
app.get('/get-profile',auth_token,get_profile)
app.post('/signup',upload.none(),schema_validation,check_user_status,signup)
app.post('/set-password',auth_token,pass_schema_validation,set_password)
app.post('/logindata',login)
app.get('/get-suggestions',auth_token,get_suggestions)
app.get('/follow',auth_token,follow)
app.get('/unfollow',auth_token,unfollow)
app.get('/get-selfprofile',auth_token,get_self_profile)
app.get('/get-followings',auth_token,get_following)
app.get('/get-follower',auth_token,get_follower)
app.get('/get-dashboard',auth_token,get_dashboard)
app.post('/post-tweet',upload.none(),auth_token,post_tweet)
app.get('/like',auth_token,like)
app.get('/unlike',auth_token,unlike)
app.get('/retweet',auth_token,retweet)

 app.listen(8080,()=>{
    console.log("running on 8080");
 })