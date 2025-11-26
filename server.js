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
      res.status(200).send('Login successful!');
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

app.listen(port, () => {
  console.log(`🚀 Server running at http://localhost:${port}`);
});

