require 'pg'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

task :setup_database do
  setup_database('chitter_app')
  setup_database('chitter_app_test')
end

def setup_database(database_name)
   conn = PG.connect(dbname: 'postgres')
   conn.exec("CREATE DATABASE #{database_name}")
   conn.close

   db = PG.connect(dbname: database_name)

   db.exec(
     'CREATE TABLE users ( ' \
     'id serial PRIMARY KEY, ' \
     'username VARCHAR(40) NOT NULL UNIQUE, ' \
     'email VARCHAR(100) NOT NULL UNIQUE, ' \
     'hashed_password VARCHAR(300) NOT NULL)'
   )

   db.exec(
     'CREATE TABLE peeps ( ' \
     'id serial PRIMARY KEY, ' \
     'content VARCHAR(240), ' \
     'created_at TIMESTAMP default current_timestamp, ' \
     'user_id INT REFERENCES users(id) ' \
     'ON UPDATE CASCADE ' \
     'ON DELETE CASCADE)'
   )
 end
