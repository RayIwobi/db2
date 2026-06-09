require("dotenv").config();

const mysql = require("mysql2/promise");
const fs = require("fs");

async function importDB() {
  console.log("DB:", process.env.MYSQLDATABASE);

  const conn = await mysql.createConnection({
    host: process.env.MYSQLHOST,
    port: process.env.MYSQLPORT,
    user: process.env.MYSQLUSER,
    password: process.env.MYSQLPASSWORD,
    database: process.env.MYSQLDATABASE,
    multipleStatements: true
  });

  const sql = fs.readFileSync("cbt_system.sql", "utf8");

  await conn.query(sql);

  console.log("✅ Import successful");
  await conn.end();
}


importDB().catch(console.error);