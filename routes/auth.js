const router = require("express").Router();
const { check, validationResult } = require("express-validator");

const bcrypt = require("bcrypt");
const JWT = require("jsonwebtoken");

///////////////////////////

router.post(
  "/register",
  [
    check("email", "Molimo unesite validan Email").isEmail(),
    check("password", "Lozinka mora biti duza od 5 karaktera").isLength({
      min: 6,
    }),
  ],

  async (req, res) => {
    const { email, password } = req.body;
    //Validate Input
    const errors = validationResult(req);

    if (!errors.isEmpty()) {
      return res.status(400).json({
        errors: errors.array(),
      });
    }
    console.log(password, email);

    //Validate if user already exist
    const user = db.find((user) => {
      return user.email === email;
    });
    if (user) {
      return res.status(400).json({
        errors: [
          {
            msg: "Korisnik vec postoji",
          },
        ],
      });
    }
    //Hashing password
    let hashedPassword = await bcrypt.hash(password, 10);

    db.push({
      email,
      password: hashedPassword,
    });
    //JWT
    const token = await JWT.sign(
      {
        email,
      },
      "12412lknknkn12knln",
      {
        expiresIn: 3600000,
      }
    );
    res.json({
      token,
    });
    res.send("Validation uspesna!");
  }
);
//LOGIN // LOGIN
router.post("/login", async (req, res) => {
  const { email, password } = req.body;
  // Check if user with email exists

  let user = db.find((user) => {
    return user.email === email;
  });

  if (!user) {
    return res.status(422).json({
      errors: [
        {
          msg: "Ne vazeci email ili lozinka",
        },
      ],
    });
  }

  // Check if the password if valid
  let isMatch = await bcrypt.compare(password, user.password);

  if (!isMatch) {
    return res.status(404).json({
      errors: [
        {
          msg: "Ne vazeci email ili lozinka",
        },
      ],
    });
  }

  // Send JSON WEB TOKEN
  const token = await JWT.sign({ email }, "nfb32iur32ibfqfvi3vf932bg932g932", {
    expiresIn: 360000,
  });

  res.json({
    token,
  });
});

router.get("/all", (req, res) => {
  res.json(db);
});

module.exports = router;
