require 'pg'

task :test_database_setup do

  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("TRUNCATE peeps;")

  connection.exec("INSERT INTO peeps VALUES(1, '#{Time.now.to_s[0..-7]}', 'test_name', 'test peep number one');")
  connection.exec("INSERT INTO peeps VALUES(2, '#{Time.now.to_s[0..-7]}', 'user_test', 'test peep number two');")
  connection.exec("INSERT INTO peeps VALUES(3, '#{Time.now.to_s[0..-7]}', 'test_user', 'test peep number three');")
end

task :setup do
  p "Creating databases..."

  ['chitter', 'chitter_test'].each do |database|

    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY,time VARCHAR(19),user VARCHAR(15),message VARCHAR(150));")
    rescue PG::DuplicateDatabase => error
      p error
      p "#{ database } already exists"
  end
end
