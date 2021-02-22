const express=require('express')
const commentrouter=express.Router()
const {addnewcomment,replytocomment}=require('../controller/commentcontrollers.js')


commentrouter.post('/newcomment',addnewcomment)

commentrouter.post('/replycomment',replytocomment)

module.exports=commentrouter