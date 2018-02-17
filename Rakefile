require 'pg'

task :setup do
  p "Creating databases..."

  ['cheeter_development', 'cheeter_development_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE cheeter(name VARCHAR(40), text VARCHAR(60), time timestamp DEFAULT current_timestamp);")
  end
end

task :test_database_setup do
  p "Cleaning database"

  if ENV['ENVIRONMENT'] == 'test'

    DatabaseConnection.setup("cheeter_development_test")
    DatabaseConnection.query("TRUNCATE cheeter")
    DatabaseConnection.query("INSERT INTO cheeter VALUES('jenny', 'Hello, I am having dinner')")
    DatabaseConnection.query("INSERT INTO cheeter VALUES('mary', 'enjoying my ice cream')")
  end
end
