const express = require('express')
const multer = require('multer')
const path = require('path')
const blogrouter = express.Router()

const { newblog, deleteblog, createnewblog, displayeachblog, editblogbyid,updateblogbyid } = require('../controller/blogcontrollers.js')

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, './uploads')
    },
    filename: function (req, file, cb) {
        cb(null, file.fieldname + '-' + new Date().toISOString().replace(/:/g, '-') + file.originalname)
    }
})

const upload = multer({ storage: storage })


/* blogrouter.get('/editblog', editblog) */

blogrouter.get('/newblog', newblog)

blogrouter.get('/editblog/:id', editblogbyid)

blogrouter.get('/eachblog/:id', displayeachblog)

blogrouter.put('/editblog/:id',upload.single('blogimage') ,updateblogbyid) 

blogrouter.delete('/deleteblog/:id', deleteblog)

blogrouter.post('/newblog', upload.single('blogimage'), createnewblog)

module.exports = blogrouter