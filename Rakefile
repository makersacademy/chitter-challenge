require_relative 'app'
require './lib/User'
require 'data_mapper'
require 'rspec/core/rake_task'


# require_relative '.lib/User'

desc "Trucates tables"
namespace :db do 
  task :auto_migrate do
    DataMapper.auto_migrate! 
    # if ENV['RACK_ENV'] == 'test'
    puts "Migration successfull"
  end
end

desc "Data stores"
namespace :db do
  task :auto_upgrade do
    DataMapper.auto_upgrade! 
    # if ENV['RACK_ENV'] == 'development'
    puts "Upgrade successful"
  end
end