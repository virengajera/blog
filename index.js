const express = require('express')
const path=require('path')
const methodOverride = require('method-override')
const bodyParser=require('body-parser')
const morgan=require('morgan')
const { connection, mysql } = require('./models/connection.js')
const blogrouter=require('./routes/blogroutes.js')
const commentrouter=require('./routes/commentroutes.js')
const PORT=process.env.PORT || 3000
const app = express()

require('dotenv').config()

app.use(morgan('dev'))

app.set('view engine','ejs')

app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())
app.use(methodOverride('_method'))


app.use(express.static(path.join(__dirname,"public")))
app.use('/uploads',express.static(path.join(__dirname,"uploads")))

app.get('/',(req,res)=>{
  connection.query('SELECT * FROM blog',(err,results,fields)=>{
    if(err) throw err;
    res.render('index.ejs',{"results":results})
  })
})

app.use('/blog',blogrouter)
app.use('/comment',commentrouter)


app.listen(PORT, () => {console.log(`listening at ${PORT}`) })
