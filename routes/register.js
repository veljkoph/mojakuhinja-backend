const express = require("express");
const router = express.Router();
const bodyParser = require("body-parser");
const dotenv = require("dotenv");
const bcrypt = require("bcrypt");
const db = require("../db");
const { check, validationResult } = require("express-validator");

router.use(express.json());
router.use(
  bodyParser.urlencoded({
    extended: true,
  })
);

// Register user
// router.post(
//   "/register",
//   [
//     check("userEmail", "Molimo unesite validan Email").isEmail(),
//     check("userPassword", "Lozinka mora biti duza od 5 karaktera").isLength({
//       min: 6,
//     }),
//     check("userPasswordConf")
//       .exists()
//       .custom((value, { req }) => {
//         if (value != req.body.userPassword) {
//           throw new Error("Lozinke se ne podudaraju");
//         }
//         return true;
//       }),
//   ],
//   async (req, resReg) => {
//     const userName = req.body.userName;
//     const userEmail = req.body.userEmail;
//     const userPassword = req.body.userPassword;
//     const errors = validationResult(req);
//     const hashedPassword = await bcrypt.hash(userPassword, 10);

//     const existingUser = db.query(
//       "SELECT * FROM users WHERE email = ?",
//       [userEmail],
//       (err, res) => {
//         if (res.length === 0 && errors.isEmpty()) {
//           const sqlInsert =
//             "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
//           db.query(
//             sqlInsert,
//             [userName, userEmail, hashedPassword],
//             (err, result) => {
//               if (err) {
//                 console.log(err);
//               }
//             }
//           );
//         }

//         if (!errors.isEmpty()) {
//           resReg.json({
//             message: errors.errors[0].msg,
//           });
//         } else if (res.length !== 0) {
//           resReg.json({
//             message: "Korisnik već postoji",
//           });
//         } else {
//           resReg.json({
//             message: "Uspešna registracija",
//           });
//         }
//       }
//     );
//   }
// );
// //login
// router.post("/login", (req, res) => {
//   const email = req.body.userEmail;
//   const password = req.body.userPassword;

//   db.query(
//     "SELECT * FROM users WHERE email = ?",
//     email,
//     async (err, results) => {
//       if (err) {
//         console.log(err);
//       }
//       const validPassword = await bcrypt.compare(password, results[0].password);

//       if (results.length > 0) {
//         if (validPassword) {
//           res.json({
//             loggedIn: true,
//             username: email,
//             name: results[0].name,
//             image: results[0].image,
//             id: results[0].id,
//           });
//         } else {
//           res.json({
//             loggedIn: false,
//             message: "Nevažeći email ili lozinka!",
//           });
//         }
//       } else {
//         res.json({
//           loggedIn: false,
//           message: "Nevažeći email ili lozinka!",
//         });
//       }
//     }
//   );
// });

// //Change picture

// router.put("/changepic", (req, res) => {
//   const userID = req.body.userID;
//   const image = req.body.image;
//   const sql = `UPDATE users SET image='${image}' WHERE users.id=${userID}`;

//   db.query(sql, (err, res2) => {
//     res.send(res2);
//     console.log(res2);
//   });
// });

module.exports = router;
