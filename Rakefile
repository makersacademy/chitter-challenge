require 'pg'
task :setup do
  p "Creating databases..."

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE users(email VARCHAR(60) PRIMARY KEY,
                    password_hash VARCHAR(300));")
    connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, 
                    email VARCHAR(60),
                    FOREIGN KEY (email) REFERENCES users(email),
                    text VARCHAR(300),
                    dt timestamp default (now()));")
  end
end

task :test_database_setup do
  p "Cleaning database..."

  ['chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE users(email VARCHAR(60) PRIMARY KEY,
                    password_hash VARCHAR(300));")
    connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, 
                    email VARCHAR(60),
                    FOREIGN KEY (email) REFERENCES users(email),
                    text VARCHAR(300),
                    dt timestamp default (now()));")
  end

  connection = PG.connect(dbname: 'chitter_test')

  # Clear the database
  connection.exec("TRUNCATE users, peeps;")

  connection.exec("INSERT INTO users VALUES('tom@hotmail.com',
                  '$argon2i$v=19$m=65536,t=2,p=1$S7x4o+E1d+7VBHLIVF1CVQ$C6L6QCNyDmhZKpZCpRkBlk42dq1BGtOOm6QQMyftIIY');")
  connection.exec("INSERT INTO users VALUES('george@gmail.com',
                  '$argon2i$v=19$m=65536,t=2,p=1$9yE2qwgLTdfINqUuhPxhYA$9Wc2Nk2SkHWPHpbuc/Lot4etxXgQqcmTfibrhazOszs');")
  connection.exec("INSERT INTO users VALUES('kevin@btinternet.com',
                  '$argon2i$v=19$m=65536,t=2,p=1$migMuHTZSXPhlKyt97UiaQ$EYVzvnlUXZB1zBHFfUL++UDULTWl4o0MnqI7Ac4QwYQ');")
end

task :drop do
  p "Deleting databases..."

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect(dbname: database)
    connection.exec("DROP DATABASE #{database};")
  end
end
