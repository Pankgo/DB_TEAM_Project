const mysql = require("mysql2/promise");

const useDB = mysql.createPool({
    user : 'root',
    password : '1234',
    port : 3306,
    database : 'mydb'
});

module.exports = useDB;