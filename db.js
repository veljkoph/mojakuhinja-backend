const mysql = require("mysql");
const dotenv = require("dotenv");

dotenv.config({
  path: ".env",
});

const db = mysql.createConnection({
  host: "eu-cdbr-west-01.cleardb.com",
  user: "b42a7f9283b519",
  password: "fcbad914",
  database: "heroku_6fc8e0f4cdb8f98",
});
db.connect(function (err) {
  if (err) {
    console.log(err, "Error db");
    setTimeout(2000);
  } else {
    console.log("Connected!");
  }
});

module.exports = db;
