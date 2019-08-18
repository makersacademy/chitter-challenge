require "./app.rb"
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

namespace :db do
  task :load_config do
    require "./app.rb"
  end
end

desc "Drops and creates both chitter and chitter test databases. Run rebuild_{type}_database to populate"
task :create_dbs do
  conn = PG.connect(dbname: 'postgres')
  puts "Dropping Chitter and Chitter Test"
  conn.exec('drop database if exists chitter;')
  conn.exec('drop database if exists chitter_test;')
  puts "Creating Chitter and Chitter Test"
  conn.exec('create database chitter;')
  conn.exec('create database chitter_test;')
end

desc "Drops all tables and recreates them in the dev db"
task :rebuild_dev_db do
  print "rebuilding dev db..."
  conn = PG.connect(dbname: 'chitter')
  run_scripts(conn)
  print " Fin:  "
end

desc "Drops all tables and recreates with seed data in the test db"
task :rebuild_test_db do
  print "rebuilding test db..."
  conn = PG.connect(dbname: 'chitter_test')
  run_scripts(conn)
  conn.exec(File.open('./db/seed_test.sql', &:read))
  print " Fin:  "
end

def run_scripts(conn)
  conn.exec('drop table if exists peeps;')
  conn.exec('drop table if exists users;')
  conn.exec(File.open('./db/migrate/01_create_users_table.sql', &:read))
  conn.exec(File.open('./db/migrate/02_create_peeps_table.sql', &:read))
end

task :rebuild_dbs do
  Rake::Task[:rebuild_dev_db].invoke
  Rake::Task[:rebuild_test_db].invoke
end
