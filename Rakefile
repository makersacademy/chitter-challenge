require 'pg'

task :test_database_setup do
  p "Cleaning database..."

  connection = PG.connect(dbname: 'chitter_test')

  connection.exec('TRUNCATE peeps;')

  connection.exec("INSERT INTO peeps VALUES('My toast was yummy', '11.35', 'sleepy_susan');")
  connection.exec("INSERT INTO peeps VALUES('Is anybody out tonight?', '17.55', 'jumpy_tony');")
  connection.exec("INSERT INTO peeps VALUES('Why is my head so sore?', '08.21', 'milky_matt');")
end

task :setup do
  p "Creating databases..."
  ['chitter'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE peeps(peep VARCHAR, time VARCHAR, username VARCHAR);")
  end
end
