require 'pg'

task :setup do
  p "Creating databases..."

  ['cheeter_development', 'cheeter_development_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE cheeter(name VARCHAR(40), text VARCHAR(60), time timestamp DEFAULT current_timestamp);")
    connection.exec("CREATE TABLE newuser(name VARCHAR(60), password VARCHAR(60))")
  end
end

task :test_database_setup do
  p "Cleaning database"

  if ENV['ENVIRONMENT'] == 'test'

    DatabaseConnection.setup("cheeter_development_test")
    DatabaseConnection.query("TRUNCATE cheeter")
    DatabaseConnection.query("INSERT INTO cheeter VALUES('jenny', 'Hello, I am having lunch')")
    DatabaseConnection.query("INSERT INTO cheeter VALUES('mary', 'enjoying my ice cream')")
  end
end

task :remove_database do
    ['cheeter_development', 'cheeter_development_test'].each do |database|
      connection = PG.connect
      connection.exec("DROP DATABASE #{ database };")
      p "Deleted #{database}"
  end
end
