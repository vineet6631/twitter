exports.general_res=(data,message,res)=>{
    console.log("in gen res");
    
     return res.json({data:data,message:message})
}