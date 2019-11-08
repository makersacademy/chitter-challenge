require 'pg'
require_relative 'login_helper'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("DROP TABLE IF EXISTS peep, chitter_user;")
  connection.exec("CREATE TABLE chitter_user (
    email varchar(255) PRIMARY KEY,
    password varchar(255) NOT NULL,
    username varchar(255) UNIQUE,
    name varchar(255) NOT NULL,
    image text
  );")
  connection.exec("CREATE TABLE peep (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255),
    text TEXT NOT NULL,
    date timestamp NOT NULL,
    FOREIGN KEY (username) REFERENCES chitter_user(username)
  );")
  register
end
