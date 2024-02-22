// const express = require("express");
// const translate = require('translate-google')
// const path = require('path');
// const ejsmate = require("ejs-mate");
// const multer = require('multer'); // Import multer

// const app = express();

// app.set("view engine", "ejs");
// app.set("views", path.join(__dirname, "views"));
// app.use(express.json());
// app.use(express.urlencoded({ extended: true }));
// app.engine('ejs', ejsmate);

// // Configure multer
// const upload = multer();

// app.get("/form", (req, res) => {
//     res.render("index");
// });

// // Use upload middleware to handle form-data
// app.post("/translate", upload.none(), async (req, res) => {
//     try {
//         if (!req.body || !req.body.english) {
//             res.status(400).json({ error: 'Invalid request body. Please provide an "english" key with English text to translate.' });
//             return;
//         }

//         const english = req.body.english;
//         let translatedText = '';
//          translatedText = await translate(english, { to: 'fr' });

//         console.log(`Text: ${english}`);
//         console.log(`Translation: ${translatedText}`);
//         console.log("Translated Text:", translatedText);
//         res.render('index', { translatedText: translatedText });
//         // if (req.accepts('json')) {
//         //     res.json({ translation: translatedText });
//         // } else {
//         //     res.render('index', { translatedText: translatedText });
//         // }
//     } catch (err) {
//         console.error(err);
//         res.status(500).json({ error: 'Internal server error.' });
//     }
// });

// app.listen("8080", () => {
//     console.log("Server is running on port 8080");
// });
// <!DOCTYPE html>
// <html lang="en">
// <head>
//     <meta charset="UTF-8">
//     <meta name="viewport" content="width=device-width, initial-scale=1.0">
//     <title>English to French Translation</title>
// </head>
// <body>
//     <h1>English to French Translation</h1>
//     <form method="post" action="/translate">
//         <label for="english" class="form-label">Enter English Text</label>
//         <input type="text" name="english" id="english" placeholder="Enter English text" required/>
//         <button type="submit">Translate</button>

// </form>

// <% if (translatedText !== null && translatedText !== undefined) { %>

//     <p> <%= translatedText %></p>
//      <% }  %>
// </body>
// </html>
