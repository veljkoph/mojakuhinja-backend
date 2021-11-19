const express = require("express");
const app = express();
const cors = require("cors");
app.use(
  cors({
    origin: "https://moja-kuhinja.netlify.app/*",
  })
);

const PORT = 3001;
//registration

app.use(function (req, res, next) {
  res.header("Access-Control-Allow-Origin", cors.origin);
  res.header("Access-Control-Allow-Methods", "GET,PUT,POST,DELETE");
  res.header("Access-Control-Allow-Headers", "Content-Type");
  next();
});

const registerRouter = require("./routes/register.js");
app.use("/user", registerRouter);

//recipes
const recipeRouter = require("./routes/recipe");
app.use("/recipe", recipeRouter);

app.listen(process.env.PORT || PORT, () => {
  console.log("Running on a port");
});
// app.listen(3001, () => {
//   console.log("Running on a port:3001");
// });
