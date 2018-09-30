require 'database_connection'

def setup_test_database
  DatabaseConnection.setup('chitter_database_test')
  #setup table peeps
  DatabaseConnection.exec('DROP TABLE peeps')
  DatabaseConnection.exec('CREATE TABLE peeps (id SERIAL PRIMARY KEY, content VARCHAR(180), time TIMESTAMPTZ)')
  DatabaseConnection.exec("INSERT INTO peeps (content, time) VALUES('Happy new year.', '2018-01-01 00:00')")
  DatabaseConnection.exec("INSERT INTO peeps (content, time) VALUES('Merry Christmas.', '2017-12-25 10:00')")
  DatabaseConnection.exec("INSERT INTO peeps (content, time) VALUES('Trump was inagurated 2 years ago. Sad.', '2018-01-13 11:23')")

  #setup table users
  DatabaseConnection.exec('DROP TABLE users')
  DatabaseConnection.exec('CREATE TABLE users (id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(240))')
end
