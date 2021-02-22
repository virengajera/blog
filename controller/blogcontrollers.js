const { connection, mysql } = require('../models/connection.js')
const fs=require('fs')
const util = require('util');
const query = util.promisify(connection.query).bind(connection);
const marked=require('marked')
const createDOMPurify = require('dompurify');
const { JSDOM } = require('jsdom');
const DOMPurify = createDOMPurify(new JSDOM().window);

function newblog(req, res) {
    res.render('newblog.ejs', { "results": [{ blogid: "", blogtitle: "", blogdescription: "",markdown:"", blogcontent: "" }] })
}

async function deleteblog(req, res) {
    const bid = Number(req.params.id) > 0 ? Number(req.params.id) : null

    const f=await query("SELECT blogimage FROM blog WHERE blogid=?", [bid])
    fs.unlinkSync('./uploads/'+f[0].blogimage)
    const results1=await query("DELETE from reply WHERE replyid IN (select r.replyid from (SELECT * FROM reply) r JOIN comment c on r.commentid=c.commentid WHERE c.blogid=?)", [bid])
    const results2=await query("DELETE FROM comment WHERE comment.blogid=?", [bid])
    const results3=await query("DELETE FROM blog WHERE blogid=?", [bid])
    console.log("Deleted blog and sub table  rows affected :",results1.affectedRows,results2.affectedRows,results3.affectedRows)
    res.redirect('/')

}
async function createnewblog(req, res) {

    const cleanhtml=markdown_to_html(req.body.markdown)
    const sql="INSERT INTO blog (blogtitle,blogdate,blogdescription,markdown,blogcontent,blogimage) VALUES (?,?,?,?,?,?)";
    const values=[req.body.title,new Date(),req.body.description,req.body.markdown,cleanhtml,req.file.filename]
    const results=await query(sql, values)
    console.log("number of rows addeded "+ results.affectedRows)
    res.redirect('/')

}

async function displayeachblog(req, res) {
    
    const final=new Object()
    const bid = Number(req.params.id) > 0 ? Number(req.params.id) : null
    

    let r1=await query('select * from blog where blog.blogid=?',[bid])
    final["results"]=r1;
    let r2=await query('select commentid,commentusername,commentcontent from comment where comment.blogid=?',[bid])
    final["comments"]=r2
    let r3=await query('select * from reply where commentid in (select commentid from comment where comment.blogid=?)',[bid])
  
    final["comments"].forEach(element=>{
      element["replies"]=new Array()
    })
    
    r3.forEach(element => {
      final["comments"].forEach(element2=>{
        if(element2.commentid===element.commentid)
        {
           element2["replies"].push(JSON.parse(JSON.stringify(element)))
        }
      })
    });
    res.render('eachblog.ejs', final)

}
async function editblogbyid(req, res) {
    const bid = Number(req.params.id) > 0 ? Number(req.params.id) : null
    const sql = "SELECT * FROM BLOG WHERE blogid=?";
    const values = [bid]
    const results=await query(sql, values)
    res.render('editblog.ejs', { "results": results })

}

async function updateblogbyid(req, res) {

    const bid = Number(req.params.id) > 0 ? Number(req.params.id) : null

    const f=await query("SELECT blogimage FROM blog WHERE blogid=?", [bid])
    fs.unlinkSync('./uploads/'+f[0].blogimage)

    const cleanhtml=markdown_to_html(req.body.markdown)
    const sql="UPDATE blog SET blogtitle=?,blogdate=?,blogdescription=?,markdown=?,blogcontent=?,blogimage=? WHERE blogid=?";
    const values=[req.body.title,new Date(),req.body.description,req.body.markdown,cleanhtml,req.file.filename,bid]
    const results=await query(sql, values)
    console.log("number of rows Deleted "+ results.affectedRows)
    res.redirect('/')

}


function markdown_to_html(mkdown){

  return DOMPurify.sanitize(marked(mkdown))

}


module.exports = { newblog, deleteblog, createnewblog, displayeachblog, editblogbyid, updateblogbyid }