const mysql = require('mysql2');
    
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