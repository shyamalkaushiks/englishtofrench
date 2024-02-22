const express = require("express");
const translate = require('translate-google')
const path = require('path');
const ejsmate = require("ejs-mate");
const multer = require('multer'); // Import multer

const app = express();

app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.engine('ejs', ejsmate);

// Configure multer
const upload = multer();

app.get("/form", (req, res) => {
    res.render("index");
});

// Use upload middleware to handle form-data
app.post("/translate", upload.none(), async (req, res, next) => {
    try {
        if (!req.body || !req.body.english) {
            res.status(400).json({ error: 'Invalid request body. Please provide an "english" key with English text to translate.' });
            return;
        }

        const english = req.body.english;
        const translatedText = await translate(english, { to: 'fr' });

        console.log(`Text: ${english}`);
        console.log(`Translation: ${translatedText}`);
        console.log("Translated Text:", translatedText);

        // Check if the Content-Type is application/x-www-form-urlencoded
        if (req.get('Content-Type') === 'application/x-www-form-urlencoded') {
            // If the request is from a form submission, render the result template
            res.render("result", { translatedText, english });
        } else {
            // If the request is from a testing platform, respond with JSON
            res.json({ translatedText });
        }
      
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Internal server error.' });
    }
});

app.listen("8080", () => {
    console.log("Server is running on port 8080");
});
