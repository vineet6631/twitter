var mysql=require('mysql2')
require('dotenv').config()          

const con= mysql.createConnection({
        host: "iaiqf.h.filess.io",
        port:3307,
        user: "twitter_menfewshoe",
        password:"bf8e056dc1f919991295282f9310178fa02ca2db",
        database: "twitter_menfewshoe",
        timezone:"+05:30"
    })
       
    module.exports={con};