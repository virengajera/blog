const mysql = require('mysql');
const connection = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'blogdb'
});


module.exports={connection,mysql}