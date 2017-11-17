require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'app/app'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  
  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]
end

namespace :db do
  task :ugpgrade do
    DataMapper.auto_upgrade!
    puts "Auto-upgrade complete (no data loss)"
  end

  task :migrate do
    puts "Data may be lost. Press 'm' to proceed."
    if gets.chomp == "m"
      DataMapper.auto_migrate!
      puts "Auto-migrate complete (data might have been lost)"
    else
      puts "Auto-migrate aborted"
    end
  end
end
