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

task :create_dbs do
  conn = PG.connect(dbname: 'postgres')
  puts "This will drop the dev and test database. Are you sure? (y/n)?"
  if gets.chomp == "y"
    puts "Dropping Chitter and Chitter Test"
    conn.exec('drop database if exists chitter;')
    conn.exec('drop database if exists chitter_test;')
    puts "Creating Chitter and Chitter Test"
    conn.exec('create database chitter;')
    conn.exec('create database chitter_test;')
  else
    puts "No action taken"
  end
end

task :rebuild_dev_database do
  conn = PG.connect(dbname: 'chitter')
  conn.exec('drop table if exists users;')
  conn.exec(File.open('./db/migrate/01_create_users_table.sql', &:read))
end

task :rebuild_test_database do
  conn = PG.connect(dbname: 'chitter_test')
  conn.exec('drop table if exists users;')
  conn.exec(File.open('./db/migrate/01_create_users_table.sql', &:read))
  conn.exec(File.open('./db/seed_test.sql', &:read))
end
