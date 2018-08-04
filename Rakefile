if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

task :setup do
  p "Creating databases..."

  ['user_tweets', 'user_tweets_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE tweet_info(id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(60));")
    connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(140));")
  end
end

task :test_database_setup do
  p "Cleaning database..."

  connection = PG.connect(dbname: 'user_tweets_test')

  # Clear the database
  connection.exec("TRUNCATE tweet_info;")
+  connection.exec("TRUNCATE users;")

  # Add the test data
  connection.exec("INSERT INTO tweet_info VALUES(This is my first tweet);")
  connection.exec("INSERT INTO tweet_info VALUES(This is my second tweet)")
  connection.exec("INSERT INTO tweet_info VALUES(This is my fifteenth tweet));")
end

task :teardown do
  p "Clearing the database"
  confirm = STDIN.gets.chomp
  return unless confirm == 'y'
  ['user_tweets', 'user_tweets_test'].each do |database|
    connection = PG.connect
    connection.exec("DROP DATABASE #{ database }")
  end
end
