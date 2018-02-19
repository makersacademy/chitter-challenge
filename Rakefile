require 'pg'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

task :setup_test_database do
  connection = PG.connect dbname: 'chitter_' + ENV['RACK_ENV']
  connection.exec "TRUNCATE users CASCADE;
  INSERT INTO users
  VALUES (1, 'catmania505@freemail.com', 'password', 'John', 'catman505');
  INSERT INTO users
  VALUES (2, 'doglover@yomail.com', 'password', 'Jenny', 'doggirl22');
  INSERT INTO peeps
  VALUES (1, 'I love cats', '11:31AM, 18 February, 2018', 2);
  INSERT INTO peeps
  VALUES (2, 'I love dogs', '11:50AM, 18 February, 2018', 1);"
  # connection.exec "TRUNCATE comments;"
end

# Uncomment below and run 'rake setup' from the terminal on first use
# Don't forget to run 'gem install bundler' and 'bundle install' first!!!

# 
# task :setup do
#   ["chitter_development", "chitter_test"].each do |db_name|
#     connect = PG.connect
#     connect.exec("DROP DATABASE IF EXISTS #{db_name}")
#     connect.exec("CREATE DATABASE #{db_name}")
#     connection = PG.connect dbname: db_name
#     connection.exec("CREATE TABLE users (id SERIAL PRIMARY KEY, email VARCHAR
#       (60), password VARCHAR(60), name VARCHAR(60), handle VARCHAR(60));
#       CREATE TABLE peeps (id SERIAL PRIMARY KEY, text VARCHAR
#       (240), time VARCHAR(60), user_id INT REFERENCES users(id) );
#       ")
#   end
# end
