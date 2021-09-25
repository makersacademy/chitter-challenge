# frozen_string_literal: true

require 'pg'

task :setup do
  p 'Creating databases...'

  %w[chitter chitter_test].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database};")
    connection = PG.connect(dbname: database)
    
    connection.exec("CREATE TABLE users (id SERIAL PRIMARY KEY,
      username VARCHAR (50) UNIQUE,
      email VARCHAR (50) UNIQUE,
      password VARCHAR (100)
    );")

    connection.exec("CREATE TABLE peeps (id SERIAL PRIMARY KEY,
    username VARCHAR (50),
    FOREIGN KEY (username) REFERENCES users (username),
    peep VARCHAR(100),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
    );")
   
  end
end
