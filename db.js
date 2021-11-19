const mysql = require("mysql");
const dotenv = require("dotenv");

dotenv.config({
  path: ".env",
});

const db = mysql.createPool({
  host: "eu-cdbr-west-01.cleardb.com",
  user: "b42a7f9283b519",
  password: "fcbad914",
  database: "heroku_6fc8e0f4cdb8f98",
});

module.exports = db;
