const { connection, mysql } = require('../models/connection.js')
const util = require('util');
const query = util.promisify(connection.query).bind(connection);




async function addnewcomment(req,res){
    const bid = Number(req.body.blogid)
    console.log(req.body)
    console.log(bid)
    const sql="INSERT INTO comment (blogid,commentusername,commentcontent) VALUES (?,?,?)";
    const values=[bid,req.body.commentusername,req.body.commentcontent]
    const results=await query(sql, values)
    console.log("number of rows Added "+ results.affectedRows)
    res.redirect(`/blog/eachblog/${bid}`)
}

async function replytocomment(req,res){
    const commentid=Number(req.body.commentid)
    const blogid=Number(req.body.blogid)
    const replyusername=req.body.replyusername
    const replycontent=req.body.replycontent

    const sql="INSERT INTO reply (commentid,replyusername,replycontent) VALUES (?,?,?)";
    const values=[commentid,replyusername,replycontent];
    const results=await query(sql,values);
    console.log("number of rows Added "+ results.affectedRows)
    res.redirect(`/blog/eachblog/${blogid}`)
}

module.exports={addnewcomment,replytocomment}