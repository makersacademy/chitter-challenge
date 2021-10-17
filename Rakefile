require 'pg'
require './dummy_posts'
require './dummy_users'

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
        replying_to INT,
        FOREIGN KEY (author)
        REFERENCES users (id),
        FOREIGN KEY (replying_to)
        REFERENCES peeps (id)
        );"
    )

    p 'Success!'
  end
end

task :populate_database do
  connection = PG.connect(dbname: 'chitter')

  users = []
  DUMMY_USERS.each do |data|
    user = connection.exec(
      "INSERT INTO users(first_name, last_name, username, email, password)
      VALUES('#{data[0]}', '#{data[1]}', '#{data[2]}', '#{data[3]}', '#{data[4]}') RETURNING id;"
    )
    users << user[0]['id']
  end

  DUMMY_POSTS.each do |text|
    connection.exec(
      "INSERT INTO peeps(text, time, author) VALUES('#{text}',
      '#{rand((Time.now.utc - 10000000)..Time.now.utc)}', #{users.sample});"
    )
  end

  p "Added #{DUMMY_USERS.length} users"
  p "Added #{DUMMY_POSTS.length} posts"
end

task :reset_database do
  connection = PG.connect(dbname: 'chitter')

  connection.exec("TRUNCATE TABLE users, peeps;")
  p "Database has been reset"
end

task :setup_test_database do
  p "Resetting test database..."
  
  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("TRUNCATE TABLE users, peeps;")
end
