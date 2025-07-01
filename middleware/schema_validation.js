const Joi = require("joi")
const { general_res } = require("../helpers/general_res")


const schema=Joi.object({

    firstname:Joi.string()
                  .min(3)
                  .max(30)
                  .required(),
        
    lastname:Joi.string()
                  .min(3)
                  .max(30)
                  .required(), 
    
    email:Joi.string()
                  .email({tlds: { } }),           
  })
  const pass_schema=Joi.object({
   password:Joi.string().min(8)
 })
 const pass_schema_validation=(req,res,next)=>{
  let b=req.body
  const{value,error}=pass_schema.validate({password:b.password})
  if(error){
    general_res({success:false},error.details[0].message,res)
  }
  else{
      console.log("pass_schema validated");
      next()
      
  }
 }
const schema_validation=(req,res,next)=>{
    console.log("in schema validation func");
    let b=req.body
    console.log(b);
    
    
    const{value,error}=schema.validate({firstname:b.firstname,lastname:b.lastname,email:b.email})
    if(error){
      general_res({success:false},error.details[0].message,res)
    }
    else{
        console.log("schema validated");
        next()
        
    }
}
module.exports={schema_validation,pass_schema_validation}
  