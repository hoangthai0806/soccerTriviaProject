const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(bodyParser.json());

// Connect to MySQL
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',      // your MySQL username
  password: 'rootdb',      // your MySQL password
  database: 'soccer_trivia'
});

db.connect(err => {
  if (err) throw err;
  console.log('MySQL Connected...');
});

app.listen(3000, () => {
  console.log('Server running on port 3000');
});