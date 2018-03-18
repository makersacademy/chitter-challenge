require 'pg'

task :test_database_setup do
  p "Cleaning database..."

  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("TRUNCATE peeps;")

  connection.exec("INSERT INTO peeps VALUES('Chiaki', 'chiakimz', 'peep1', '2016-06-22 19:10:25');")
  connection.exec("INSERT INTO peeps VALUES('Chiaki', 'chiakimz', 'peep2', '2016-06-22 19:10:25');")
  connection.exec("INSERT INTO peeps VALUES('Chiaki', 'chiakimz', 'peep3', '2016-06-22 19:10:25');")
end

task :setup do
  p "Creating databases..."

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE peeps(username VARCHAR(60), userhandle VARCHAR(60), peep VARCHAR(60), time TIMESTAMP);")
  end
end
