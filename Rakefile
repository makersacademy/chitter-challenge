require 'rake'
require 'pg'

desc 'Connect to database'
task :setup_database_connection do
  if ENV['ENVIRONMENT'] == 'test'
    DatabaseConnection.setup('chitter_test')
    puts '=== Connected to test database ==='
  else
    DatabaseConnection.setup('chitter')
    puts '=== Connected to development database ==='
  end
end

desc 'Clean test database'
task :clean_test_database do
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec('TRUNCATE users, peeps RESTART IDENTITY;')
end

desc 'Setup databases'
task :setup do
  %w[chitter chitter_test].each do |database|
    connection = PG.connect
    connection.query("CREATE DATABASE #{database};")
  end
end

desc 'Migrate database tables'
task :migrate do
  %w[chitter chitter_test].each do |database|
    connection = PG.connect(dbname: database)

    connection.exec(
      "CREATE TABLE users(
        id SERIAL PRIMARY KEY,
        name VARCHAR (60) NOT NULL,
        username VARCHAR (60) UNIQUE NOT NULL,
        email VARCHAR (255) UNIQUE NOT NULL,
        password VARCHAR (80) NOT NULL
      );"
    )

    connection.exec(
      "CREATE TABLE peeps(
        id SERIAL PRIMARY KEY,
        content VARCHAR (280) NOT NULL,
        user_id INTEGER REFERENCES users (id),
        time TIMESTAMP DEFAULT CURRENT_TIMESTAMP (0)
      );"
    )
  end
end
