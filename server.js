const mysql = require('mysql2');
const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');
const bcrypt = require('bcrypt'); 

const app = express();
const port = 3000;

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'rootdb',
  database: 'soccer_trivia'
});

db.connect(err => {
  if (err) {
    console.error(' Database connection failed:', err);
  } else {
    console.log(' Connected to MySQL database.');
  }
});

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.use('/LoginScreen', express.static(path.join(__dirname, 'LoginScreen')));
app.use('/RegisterScreen', express.static(path.join(__dirname, 'RegisterScreen')));
app.use('/MainGame', express.static(path.join(__dirname, 'MainGame')));

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'LoginScreen', 'index.html'));
});

app.get('/register', (req, res) => {
  res.sendFile(path.join(__dirname, 'RegisterScreen', 'Register.html'));
});

// REGISTER ROUTE
app.post('/register', (req, res) => {
  const {player_name ,player_email, player_password } = req.body;

  if (!player_name || !player_email || !player_password) {
    return res.status(400).send('All fields are required.');
  }

  const sql = `INSERT INTO players (player_name, player_email, player_password, join_date) VALUES (?, ?, ?, NOW())`;
  db.query(sql, [player_name, player_email, player_password], (err, result) => {
    if (err) {
      console.error('Email ID already been used!', err);
      return res.status(500).send('Email ID already been used!.');
    }
    console.log('Player registered:', result);
    res.status(200).send('Registration successful!');
  });
});

// LOGIN ROUTE
app.post('/login', (req, res) => {
  const { player_email, player_password } = req.body;

  if (!player_email || !player_password) {
    return res.status(400).send('Please enter both username and password.');
  }

  const sql = 'SELECT * FROM players WHERE player_email = ?';
  db.query(sql, [player_email], (err, results) => {
    if (err) {
      console.error('Database error during login:', err);
      return res.status(500).send('Database error.');
    }
    if (results.length === 0) {     
      return res.status(401).send('Please enter your username and password!.');
    }
    const user = results[0];
    if (user.player_password === player_password) {
  res.status(200).json({
    message: "Login successful",
    player_id: user.player_id,
    player_name: user.player_name
  });
} else {
  res.status(401).send('Your Username or password is incorrect.');
}

  });
});

//QUESTION ROUTE
app.get('/get-question', (req, res) => {
  const sql = 'SELECT * FROM questions ORDER BY RAND() LIMIT 5';
  db.query(sql, (err, results) => {
    if (err) {
      console.error('Error fetching question:', err);
      return res.status(500).send('Error fetching question.');
    }
    res.json(results); 
  });
});

// SAVE SCORE
app.post('/save-score', (req, res) => {
  const { player_id, score } = req.body;

  if (!player_id || !score && score !== 0) {
    return res.status(400).send("Missing player_id or score");
  }

  const sql = "INSERT INTO leaderboard (player_id, score) VALUES (?, ?)";

  db.query(sql, [player_id, score], (err, result) => {
    if (err) {
      console.error("Error saving score:", err);
      return res.status(500).send("Database error while saving score.");
    }
    res.status(200).send("Score saved");
  });
});


// GET LEADERBOARD
app.get('/leaderboard', (req, res) => {
  const sql = `
    SELECT p.player_name, l.score
    FROM leaderboard l
    JOIN players p ON l.player_id = p.player_id
    INNER JOIN (
      SELECT player_id, MAX(score) AS max_score
      FROM leaderboard
      GROUP BY player_id
    ) AS max_scores
    ON l.player_id = max_scores.player_id AND l.score = max_scores.max_score
    ORDER BY l.score DESC`;

  db.query(sql, (err, results) => {
    if (err) {
      console.error("Error loading leaderboard:", err);
      return res.status(500).send("Error loading leaderboard");
    }
    res.json(results);
  });
});

app.listen(port, () => {
  console.log(` Server running at http://localhost:${port}`);
});
