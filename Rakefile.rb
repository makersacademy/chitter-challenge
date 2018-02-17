# if ENV['RACK_ENV'] != 'production'
#   require 'rspec/core/rake_task'
#   RSpec::Core::RakeTask.new :spec
#   task default: [:spec]
# end

# require 'pg'
require 'rubygems'
require 'data_mapper'
require  'dm-migrations'
require_relative 'database_connection_setup.rb'
require File.join(File.dirname(__FILE__), 'lib', 'cheet.rb')

task :setup do
  begin
  %w[cheeter cheeter_test].each do |database|
    # TODO - Automate database creation (requiring pg gem causes JSON error. May be solved if individually require datamapper elements and avoid serializer)
    # connection = PG.connect
    # connection.exec("CREATE DATABASE #{database}")
    DataMapper.setup(:default, "postgres:///#{database}")
    DataMapper.auto_migrate!
    # DataMapper.finalize
  end
  rescue => e
  end
end

task :setup_test_database do
  begin
  DataMapper.auto_migrate!
  # DataMapper.setup(:default, 'postgres:///cheeter_test')
  Cheet.create(
    :title      => "My first DataMapper post",
    :body       => "A lot of text ...",
    :created_at => Time.now
  )
  Cheet.create(
    :title      => "My second DataMapper post",
    :body       => "Some more text ...",
    :created_at => Time.now + 100
  )
  Cheet.create(
    :title      => "My third DataMapper post",
    :body       => "Even more text ...",
    :created_at => Time.now + 200
  )
  rescue => e
  p e
  end

end

#
# require 'pg'
# require_relative 'lib/database_connection'
#
# task :setup do
#   p "Databases being created..."
#   connection = PG.connect
#   %w[bookmark_manager bookmark_manager_test].each do |database|
#     connection.exec("CREATE DATABASE #{database}")
#     DatabaseConnection.setup(database.to_s)
#     DatabaseConnection.query('CREATE TABLE links (id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(60));')
#   end
#     p "Complete"
# end
#
# task :setup_test_database do
#   DatabaseConnection.setup('bookmark_manager_test')
#   DatabaseConnection.query("TRUNCATE links;
#   INSERT INTO links (url, title) VALUES('http://www.makersacademy.com','Makers Academy');
#   INSERT INTO links (url, title) VALUES('http://www.google.com','Google');
#   INSERT INTO links (url, title) VALUES('http://www.facebook.com','Facebook');")
# end
#
# task :drop_databases do
#   p "Databases being deleted..."
#   connection = PG.connect
#   %w[bookmark_manager bookmark_manager_test].each do |database|
#     connection.exec("DROP DATABASE #{database}")
#   end
#   p "Deleted"
# end
