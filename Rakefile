require 'pg'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

task :setup_test_database do
  connection = PG.connect dbname: 'chitter_' + ENV['RACK_ENV']
  connection.exec "TRUNCATE peeps CASCADE;
  INSERT INTO peeps
  VALUES (1, 'I love cats', 'Catman505');
  INSERT INTO peeps
  VALUES (2, 'I love dogs', 'Doggirl22');"
  # connection.exec "TRUNCATE comments;"
end

# Uncomment below and run 'rake setup' from the terminal on first use
# Don't forget to run 'gem install bundler' and 'bundle install' first!!!


# task :setup do
#   ["chitter_development", "chitter_test"].each do |db_name|
#     connect = PG.connect
#     connect.exec("DROP DATABASE IF EXISTS #{db_name}")
#     connect.exec("CREATE DATABASE #{db_name}")
#     connection = PG.connect dbname: db_name
#     connection.exec("CREATE TABLE peeps (id SERIAL PRIMARY KEY, text VARCHAR
#       (240), author VARCHAR(60))")
#   end
# end
