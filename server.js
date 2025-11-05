
const express = require('express');
const mysql = require('mysql2');
const path = require('path');
const bodyParser = require('body-parser');
const bcrypt = require('bcrypt'); 

const app = express();
const port = 3000;

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

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

app.use('/LoginScreen', express.static(path.join(__dirname, 'LoginScreen')));
app.use('/RegisterScreen', express.static(path.join(__dirname, 'RegisterScreen')));


app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'LoginScreen', 'index.html'));
});

app.get('/register', (req, res) => {
  res.sendFile(path.join(__dirname, 'RegisterScreen', 'Register.html'));
});

app.listen(port, () => {
  console.log(`🚀 Server running at http://localhost:${port}`);
});
