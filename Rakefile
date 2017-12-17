if ENV["RACK_ENV"] != "production"
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

require 'data_mapper'
require 'dm-postgres-adapter'
require './app/app.rb'

namespace :database do
  desc "it re-writes the whole database"
  task :upgrade do
    DataMapper.auto_upgrade!
    puts "upgraded (no data loss)"
  end

  desc "it updates the existing database"
  task :migrate do
    DataMapper.auto_migrate!
    puts "migrated (all data lost)"
  end
end
