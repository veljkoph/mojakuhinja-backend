const express = require("express");
const app = express();
const cors = require("cors");
app.use(
  cors({
    origin: "*",
  })
);

const PORT = process.env.PORT || "3001";
//registration

app.use(function (req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Credentials", true);
  res.header("Access-Control-Allow-Methods", "GET,PUT,POST,DELETE,OPTIONS");
  res.header(
    "Access-Control-Allow-Headers",
    "Origin,X-Requested-With,Content-Type,Accept,content-type,application/json"
  );
  next();
});

// const registerRouter = require("./routes/register.js");
// app.use("/user", registerRouter);

//recipes
// const recipeRouter = require("./routes/recipe");
// app.use("/recipe", recipeRouter);

app.set("Port", PORT);

app.listen(process.env.PORT || PORT, () => {
  console.log("Running on a port");
});
