const express = require("express");
const app = express();
const cors = require("cors");
app.use(cors());

//registration
const registerRouter = require("./routes/register.js");
app.use("/user", registerRouter);

//recipes
const recipeRouter = require("./routes/recipe");
app.use("/recipe", recipeRouter);

app.listen(3001, () => {
  console.log("Running on a port:3001");
});
