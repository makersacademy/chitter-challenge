require 'pg'


if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

# task :setup do
#   p 'Setting up databases...'
#   conn = PG.connect
#   ['chitter','chitter_test'].each do |database|
#       conn.exec("CREATE DATABASE #{database}")
#       DatabaseConnection.setup("#{database}")
#       DatabaseConnection.query(
#         "CREATE TABLE peeps (id SERIAL PRIMARY KEY, string VARCHAR(140), dateCreated TIMESTAMP);
#         CREATE TABLE users(id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(140));"
#         )
#     end
#   p 'Set up complete. "chitter" and "chitter_test" databases created'
# end
#
# task :test_setup do
#   DatabaseConnection.setup('chitter_test')
#   DatabaseConnection.query("TRUNCATE peeps;
#   TRUNCATE users;
#   INSERT INTO peeps (string, dateCreated) VALUES ('Today was a good day', '#{Time.now}');
#   INSERT INTO peeps (string, dateCreated) VALUES ('Very important statement', '#{Time.now}');")
# end
