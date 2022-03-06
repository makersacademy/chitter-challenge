require 'pg'

task :test_database_setup do
  p "Cleaning the database..."

  connection = PG.connect(dbname: 'chitter_challenge_test')
  # Clear the database
  connection.exec("TRUNCATE chitter, users;")
end

task :setup do
  p "Creating the databases..."

  ['chitter_challenge', 'chitter_challenge_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database};")
    connection = PG.connect(dbname: database)
    connection.exec(
      "CREATE TABLE chitter (
        id SERIAL PRIMARY KEY,
        message VARCHAR(140),
        time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        author_id VARCHAR(60),
        author_first_name VARCHAR(60),
        author_surname VARCHAR(60),
        author_email VARCHAR(60),
        author_username VARCHAR(60)
      );"
    ) 
   
    connection.exec(
      "CREATE TABLE users(
        id SERIAL PRIMARY KEY,
        first_name VARCHAR(100), 
        surname VARCHAR(100), 
        email VARCHAR(60),
        username VARCHAR(15),
        password VARCHAR(100)
      );"
    )
  end
end
