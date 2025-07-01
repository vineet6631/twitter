const mysql=require('mysql2')
const express=require('express')
const JWT=require('jsonwebtoken')
const { general_res } = require('../helpers/general_res')
const { con } = require('../config/db_connect')
require('dotenv').config()
const Joi = require('joi')



const signup=(req,res)=>{
  console.log(req.body);
  let b=req.body

  
  let sql=`insert into user_data (firstname,lastname,email) values ?`
  let temp_arr=[[b.firstname,b.lastname,b.email]]
  console.log(temp_arr);
  
  con.query(sql,[temp_arr],(err,results,fields)=>{
    if(err){
        console.log(err); 
        if(err.code=='ER_DUP_ENTRY'){
          general_res({success:false},"this email is already registered",res)
        }
    }
    else{
        const user_id=results.insertId
        const token = JWT.sign({
            user_id: user_id,
            firstname: b.firstname,
            lastname: b.lastname,
            email: b.email
          }, "VINEET");
        console.log(results.insertId);
        general_res({success:true,user_id:user_id,token:token},"proceeding for password",res)
    }
  })
  
  }

module.exports={signup}