const express = require("express");
const router = express.Router();
const dotenv = require("dotenv");
const db = require("../db");
const bodyParser = require("body-parser");

dotenv.config({
  path: "../.env",
});

router.use(express.json());
router.use(
  bodyParser.urlencoded({
    extended: true,
  })
);

router.post("/add", (req, res) => {
  const userDescr = req.body.userDescr;

  const userTitle = req.body.userTitle;
  const userIngridients = req.body.userIngridients;
  const userImage = req.body.userImage;
  const userTime = req.body.userTime;
  const userCategory = req.body.userCategory;
  const userTags = req.body.userTags;
  const userID = req.body.userID;

  const sqlInsert =
    "INSERT INTO recipes (descr,title,ingridients, image, users_id, category, time, tags)  VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
  db.query(
    sqlInsert,
    [
      userDescr,

      userTitle,
      userIngridients,
      userImage,
      userID,
      userCategory,
      userTime,
      userTags,
    ],
    (err, result) => {
      res.send(result);
      if (err) {
        console.log(err);
      }
    }
  );
});

//LIKE recipe
router.post("/like", (req, res) => {
  const user_id = req.body.userID;
  const recipe_id = req.body.recipeID;
  db.query(
    `SELECT * FROM likes WHERE recipes_id=${recipe_id} AND users_id=${user_id}`,
    (err2, res2) => {
      if (res2.length != 0) {
        res.send("Korisnik je vec lajkovao");
      } else {
        db.query(
          "INSERT INTO likes (recipes_id, users_id) VALUES (?,?)",
          [recipe_id, user_id],
          (err3, res3) => {
            if (err3) {
              console.log("error2", err3);
            }
            res.send(res3);
          }
        );
        db.query(
          `UPDATE recipes SET likes = likes+1 WHERE id = ${recipe_id}`,
          (err4, res4) => {
            // res.send(res4);
          }
        );
      }
    }
  );
});

//who saved recipe
router.get("/issaved", (req, result) => {
  const user_id = req.query.userID;
  const recipe_id = req.query.recipeID;
  db.query(
    `SELECT * FROM savings WHERE recipes_id=${recipe_id} AND users_id=${user_id}`,
    (err, res) => {
      if (err) {
        console.log(err);
      }
      if (res.length !== 0) {
        result.send(true);
      } else {
        result.send(false);
      }
    }
  );
});
//who liked recipe
router.get("/isliked", (req, result) => {
  const user_id = req.query.userID;
  const recipe_id = req.query.recipeID;
  db.query(
    `SELECT * FROM likes WHERE recipes_id=${recipe_id} AND users_id=${user_id}`,
    (err, res) => {
      if (err) {
        console.log(err);
      }
      if (res.length !== 0) {
        result.send(true);
      } else {
        result.send(false);
      }
    }
  );
});
//who  disliked
router.get("/isdisliked", (req, result) => {
  const user_id = req.query.userID;
  const recipe_id = req.query.recipeID;
  db.query(
    `SELECT * FROM dislikes WHERE recipes_id=${recipe_id} AND users_id=${user_id}`,
    (err, res) => {
      if (err) {
        console.log(err);
      }
      if (res.length !== 0) {
        result.send(true);
      } else {
        result.send(false);
      }
    }
  );
});

//DISLIKE recipe
router.post("/dislike", (req, res) => {
  const user_id = req.body.userID;
  const recipe_id = req.body.recipeID;
  db.query(
    `SELECT * FROM dislikes WHERE recipes_id=${recipe_id} AND users_id=${user_id}`,
    (err2, res2) => {
      if (err2) {
        console.log(err2);
      }
      if (res2.length != 0) {
        res.send("Korisnik je vec dislajkovao");
      } else {
        db.query(
          "INSERT INTO dislikes (recipes_id, users_id) VALUES (?,?)",
          [recipe_id, user_id],
          (err3, res3) => {
            if (err3) {
            }
            res.send(res3);
          }
        );
        db.query(
          `UPDATE recipes SET dislikes = dislikes+1 WHERE id = ${recipe_id}`,
          (err4, res4) => {
            if (err4) {
              console.log(err4);
            }
          }
        );
      }
    }
  );
});

//get saved recipes
router.get("/likedrecipes", (req, res) => {
  const user_id = req.query.userID;
  const query = `SELECT recipes.id, recipes.title,
   recipes.descr, recipes.ingridients, recipes.image,
   recipes.users_id, recipes.category, recipes.time
   FROM recipes
   INNER JOIN savings
   ON savings.recipes_id = recipes.id
   WHERE savings.users_id = ${user_id}`;
  db.query(query, (err, result) => {
    res.send(result);
    if (err) {
      console.log(err);
    }
  });
});

//save recipe
router.post("/save", (req, res) => {
  const user_id = req.body.userID;
  const recipe_id = req.body.recipeID;

  db.query(
    `SELECT * FROM savings WHERE recipes_id=${recipe_id} AND users_id=${user_id}`,
    (err2, res2) => {
      if (err2) {
        console.log(err2);
      }
      if (res2.length !== 0) {
        res.send("Unsaved");
        db.query(
          `DELETE FROM savings WHERE recipes_id=${recipe_id} AND users_id=${user_id}`,
          (req4, res4) => {}
        );
      } else {
        db.query(
          "INSERT INTO savings (recipes_id, users_id) VALUES (?,?)",
          [recipe_id, user_id],
          (err3, res3) => {
            if (err3) {
              console.log("error2", err3);
            }
            res.send("Saved");
          }
        );
      }
    }
  );
});
//get saved recipes
router.get("/savedrecipes", (req, res) => {
  const user_id = req.query.userID;
  const query = `SELECT recipes.id, recipes.title,
   recipes.descr, recipes.ingridients, recipes.image,
   recipes.users_id, recipes.category, recipes.time, recipes.likes, recipes.dislikes
   FROM recipes
   INNER JOIN savings
   ON savings.recipes_id = recipes.id
   WHERE savings.users_id = ${user_id}`;
  db.query(query, (err, result) => {
    if (err) {
      console.log(err);
    }
    res.send(result);
  });
});

// //getting all recipes from database
router.get("/all", (req, res) => {
  const sqlGet = "SELECT * FROM recipes LIMIT 50";
  db.query(sqlGet, (err, result) => {
    res.send(result);
    if (err) {
      console.log(err);
    }
  });
});

//search by title
router.get("/byname/:name", (req, res) => {
  const sqlGetName = `SELECT * FROM recipes WHERE title LIKE '%${req.params.name}%'`;
  db.query(sqlGetName, (err, result) => {
    res.send(result);
    if (err) {
      console.log(err);
    }
  });
});

//search by category
router.get("/bycategory/:category", (req, res) => {
  const sqlGetName = `SELECT * FROM recipes WHERE category LIKE '%${req.params.category}%' OR tags LIKE '%${req.params.category}%'`;
  db.query(sqlGetName, (err, result) => {
    res.send(result);
    if (err) {
      console.log(err);
    }
  });
});

//my recipes
router.get("/my/:id", (req, res) => {
  const sqlGetMyRec = `SELECT * FROM recipes WHERE users_id LIKE '${req.params.id}'`;
  db.query(sqlGetMyRec, (err, result) => {
    res.send(result);
    if (err) {
      console.log(err);
    }
  });
});

//delete from db
router.delete("/delete/:id", (req, res, next) => {
  db.query(
    "DELETE FROM recipes WHERE id = ?",
    [req.params.id],
    (err, result) => {
      if (!err) {
        res.send(`User with id ${req.params.id} deleted`);
      } else console.log(err);
    }
  );
});

module.exports = router;
