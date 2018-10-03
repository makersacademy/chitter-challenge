require 'database_connection'
require 'bcrypt'

def setup_test_database
  DatabaseConnection.setup('chitter_database_test')
  #setup table peeps

  DatabaseConnection.exec("DROP TABLE IF EXISTS peeps")
  DatabaseConnection.exec('CREATE TABLE peeps (id SERIAL PRIMARY KEY, content VARCHAR(180), time TIMESTAMPTZ, name VARCHAR(60), username VARCHAR(60))')
  DatabaseConnection.exec("INSERT INTO peeps (content, time, name, username) VALUES('Happy new year.', '2018-01-01 00:00', 'test_name', 'test_username')")
  DatabaseConnection.exec("INSERT INTO peeps (content, time, name, username) VALUES('Merry Christmas.', '2017-12-25 10:00', 'test_name', 'test_username')")
  DatabaseConnection.exec("INSERT INTO peeps (content, time, name, username) VALUES('Trump was inagurated 2 years ago. Sad.', '2018-01-13 11:23', 'test_name', 'test_username')")

  #setup table users
  DatabaseConnection.exec('DROP TABLE IF EXISTS users')
  DatabaseConnection.exec('CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(60), username VARCHAR(60), email VARCHAR(60), password VARCHAR(240))')
  DatabaseConnection.exec("INSERT INTO users (name, username, email, password) VALUES('test_name','test_username','test@email.com', '#{BCrypt::Password.create('password')}')")
end
