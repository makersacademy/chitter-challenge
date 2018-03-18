require 'pg'

task :test_database_setup do
  p "Cleaning database..."
end

connection = PG.connect(dbname: 'chitter_test')

connection.exec("TRUNCATE peeps;")
connection.exec("INSERT INTO peeps (time, text) VALUES('#{Time.now}', 'how are you people?');")
connection.exec("INSERT INTO peeps (time, text) VALUES('#{Time.now}', 'bored at home');")

task :setup do
  p "Creating databases..."

  connection = PG.connect
  connection.exec("CREATE DATABASE chitter;")
  connection.exec("CREATE DATABASE chitter_test;")

  connection = PG.connect(dbname: 'chitter')
  connection.exec("CREATE TABLE peeps(time VARCHAR(100), text VARCHAR(100));")

  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("CREATE TABLE peeps(time VARCHAR(100), text VARCHAR(100));")

end
