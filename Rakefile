require 'pg'

task :setup do
  p "Creating databases..."

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database};")
    connection = PG.connect(dbname: database)
    connection.exec(
      "CREATE TABLE users(
        id SERIAL PRIMARY KEY,
        username VARCHAR(15) UNIQUE NOT NULL,
        email VARCHAR(100) UNIQUE NOT NULL,
        first_name VARCHAR(25) NOT NULL,
        last_name VARCHAR(25) NOT NULL,
        password VARCHAR(60) NOT NULL
        );"
    )
    connection.exec(
      "CREATE TABLE peeps(
        id SERIAL PRIMARY KEY,
        text VARCHAR(280) NOT NULL,
        time timestamp NOT NULL,
        author INT NOT NULL,
        FOREIGN KEY (author)
        REFERENCES users (id)
        );"
    )
  end
end

task :setup_test_database do
  p "Resetting test database..."
  
  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("TRUNCATE TABLE users, peeps;")
end
