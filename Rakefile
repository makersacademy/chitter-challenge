# if ENV['RACK_ENV'] != 'production'
#   require 'rspec/core/rake_task'
#
#   RSpec::Core::RakeTask.new :spec
#
#   task default: [:spec]
# end
require 'data_mapper'
require 'pg'
require_relative 'database_connection_setup.rb'
require File.join(File.dirname(__FILE__), 'lib', 'peep.rb')

task :setup do
  ['chitter', 'chitter_test'].each do |database|
    DataMapper.setup(:default, "postgres:///#{database}")
    DataMapper.finalize
    DataMapper.auto_upgrade!
  end
end

task :test_database_setup do

  DataMapper.setup(:default, 'postgres:///chitter_test')
  DataMapper.auto_migrate!
  Peep.create(
    :content      => "DataMapper test1",
    :created_at => Time.now - 40
  )
  Peep.create(
    :content      => "DataMapper test2",
    :created_at => Time.now - 20
  )
  Peep.create(
    :content      => "DataMapper test3",
    :created_at => Time.now
  )
end

  task :teardown do
  p "Destroying databases...type 'yes' to confirm that you want to destroy the Chitter databases. This will remove all data in those databases!"

  confirm = STDIN.gets.chomp

  return unless confirm == 'yes'

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("DROP DATABASE #{ database }")
  end
end

task :create_databases do
  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database}")
  end
  p 'Databases created'
end
