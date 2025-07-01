const JWT=require('jsonwebtoken');
const { general_res } = require('../helpers/general_res');
exports.auth_token=(req,res,next)=>{
const token=req.headers.authorization
console.log("in auth_function",token);
console.log(process.env.SECRET_KEY);
if(!token || token==null){
    console.log("no token found");
    
   general_res({success:false},"link expired or invalid....!",res)
}
else{
JWT.verify(token,"VINEET",(err,decoded)=>{
    if(err){
        // res.send({ data:{success:false},
        //     message:"token invalid"
        //             })
        general_res({success:false},"link expired or invalid....!",res)
    }
    else{
        console.log("token_verified")
        next()
    }
     })
}
}