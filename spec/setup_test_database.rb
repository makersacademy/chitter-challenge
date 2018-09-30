require 'database_connection'
require 'bcrypt'

def setup_test_database
  DatabaseConnection.setup('chitter_database_test')
  #setup table peeps
  DatabaseConnection.exec('DROP TABLE peeps')
  DatabaseConnection.exec('CREATE TABLE peeps (id SERIAL PRIMARY KEY, content VARCHAR(180), time TIMESTAMPTZ, email VARCHAR(60))')
  DatabaseConnection.exec("INSERT INTO peeps (content, time, email) VALUES('Happy new year.', '2018-01-01 00:00', 'test@email.com')")
  DatabaseConnection.exec("INSERT INTO peeps (content, time, email) VALUES('Merry Christmas.', '2017-12-25 10:00', 'test@email.com')")
  DatabaseConnection.exec("INSERT INTO peeps (content, time, email) VALUES('Trump was inagurated 2 years ago. Sad.', '2018-01-13 11:23', 'test@email.com')")

  #setup table users
  DatabaseConnection.exec('DROP TABLE users')
  DatabaseConnection.exec('CREATE TABLE users (id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(240))')
  DatabaseConnection.exec("INSERT INTO users (email, password) VALUES('test@email.com', '#{BCrypt::Password.create('password')}')")
end
