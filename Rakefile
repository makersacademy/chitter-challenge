require 'rake'
require 'pg'

task :setup do
  %w[chitter chitter_test].each do |database|
    connection = PG.connect
    connection.query(
      "CREATE DATABASE #{database};"
    )
  end
end

task :migrate do
  %w[chitter chitter_test].each do |database|
    connection = PG.connect(dbname: database)

    connection.exec(
      "CREATE TABLE users(
        id SERIAL PRIMARY KEY,
        username VARCHAR (60) UNIQUE NOT NULL,
        email VARCHAR (255) UNIQUE NOT NULL,
        password VARCHAR (80) NOT NULL
      );"
    )

    connection.exec(
      "CREATE TABLE peeps(
        id SERIAL PRIMARY KEY,
        content VARCHAR (280) NOT NULL,
        time TIMESTAMP NOT NULL,
        user_id INTEGER REFERENCES users (id)
      );"
    )
  end
end
