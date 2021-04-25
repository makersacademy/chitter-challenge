require 'pg'

task :setup do
  p "Creating databases..."

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE users (id SERIAL PRIMARY KEY,
      email VARCHAR (50) UNIQUE,
      password VARCHAR (50),
      name VARCHAR (50),
      username VARCHAR (50) UNIQUE
    );")
    connection.exec("CREATE TABLE posts (id SERIAL PRIMARY KEY,
      username VARCHAR (50),
      name VARCHAR (50),
      message VARCHAR (240),
      time_posted VARCHAR (50)
    );")
  end
