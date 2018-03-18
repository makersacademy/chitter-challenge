require 'pg'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

task :full_setup do
  Rake::Task[:create_dbs].execute
  Rake::Task[:create_peeps_tables].execute
end

task :test_setup do
  p 'RAKE: setting up test enviroment'
  con = PG.connect :dbname => 'chitter_test'
  con.exec('TRUNCATE TABLE peeps RESTART IDENTITY;')
  con.exec("INSERT INTO peeps(text, author, time) "\
  "VALUES('I am peep 1', 'anonymous', "\
  "'#{Time.mktime(0).strftime("%Y-%D-%H:%M:%S")}');")
  con.exec("INSERT INTO peeps(text, author, time) "\
  "VALUES('I am peep 3', 'anonymous', "\
  "'#{Time.mktime(2).strftime("%Y-%D-%H:%M:%S")}');")
  con.exec("INSERT INTO peeps(text, author, time) "\
  "VALUES('I am peep 2', 'anonymous', "\
  "'#{Time.mktime(1).strftime("%Y-%D-%H:%M:%S")}');")
end

task :create_dbs do
  Rake::Task[:create_production_db].execute
  Rake::Task[:create_test_db].execute
end

task :create_production_db do
  dbname = 'chitter'
  p "RAKE: creating #{dbname} database"
  PG.connect.exec("CREATE DATABASE #{dbname};")
end

task :create_test_db do
  dbname = 'chitter_test'
  p "RAKE: creating #{dbname} database"
  PG.connect.exec("CREATE DATABASE #{dbname};")
end

task :drop_dbs do
  Rake::Task[:drop_production_db].execute
  Rake::Task[:drop_test_db].execute
end

task :drop_production_db do
  dbname = 'chitter'
  p "RAKE: dropping #{dbname} database"
  PG.connect.exec("DROP DATABASE #{dbname};")
end

task :drop_test_db do
  dbname = 'chitter_test'
  p "RAKE: dropping #{dbname} database"
  PG.connect.exec("DROP DATABASE #{dbname};")
end

task :create_peeps_tables do
  Rake::Task[:create_production_peeps_table].execute
  Rake::Task[:create_test_peeps_table].execute
end

task :create_production_peeps_table do
  dbname = 'chitter'
  p "RAKE: creating peeps table in #{dbname} database"
  con = PG.connect :dbname => dbname
  con.exec('CREATE TABLE peeps(id SERIAL PRIMARY KEY, '\
  'text VARCHAR(280), author VARCHAR(60), time VARCHAR(22));')
end

task :create_test_peeps_table do
  dbname = 'chitter_test'
  p "RAKE: creating peeps table in #{dbname} database"
  con = PG.connect :dbname => dbname
  con.exec('CREATE TABLE peeps(id SERIAL PRIMARY KEY, '\
  'text VARCHAR(280), author VARCHAR(60), time VARCHAR(22));')
end

task :drop_peeps_tables do
  Rake::Task[:drop_production_peeps_table].execute
  Rake::Task[:drop_test_peeps_table].execute
end

task :drop_production_peeps_table do
  dbname = 'chitter'
  p "RAKE: dropping peeps table in #{dbname} database"
  con = PG.connect :dbname => dbname
  con.exec('DROP TABLE peeps;')
end

task :drop_test_peeps_table do
  dbname = 'chitter_test'
  p "RAKE: dropping peeps table in #{dbname} database"
  con = PG.connect :dbname => dbname
  con.exec('DROP TABLE peeps;')
end

task :clear_peeps_tables do
  Rake::Task[:clear_production_peeps_table].execute
  Rake::Task[:clear_test_peeps_table].execute
end

task :clear_production_peeps_table do
  dbname = 'chitter'
  p "RAKE: clearing peeps table in #{dbname} database"
  con = PG.connect :dbname => dbname
  con.exec('TRUNCATE TABLE peeps RESTART IDENTITY;')
end

task :clear_test_peeps_table do
  dbname = 'chitter_test'
  p "RAKE: clearing peeps table in #{dbname} database"
  con = PG.connect :dbname => dbname
  con.exec('TRUNCATE TABLE peeps RESTART IDENTITY;')
end
