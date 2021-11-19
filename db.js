const mysql = require("mysql");
const dotenv = require("dotenv");

dotenv.config({
  path: ".env",
});

const db = mysql.createConnection({
  host: DB_HOST,
  user: DB_USER,
  password: DB_PASSWORD,
  database: DB_DATABASE,
});
db.connect(function (err) {
  if (err) {
    console.log(err);
  } else {
    console.log("Connected!");
  }
});

module.exports = db;
