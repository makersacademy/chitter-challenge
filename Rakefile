require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'app/app'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  
  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]
end

namespace :db do
  task :upgrade do
    DataMapper.auto_upgrade!
    puts "Auto-upgrade complete (no data loss)"
  end

  task :migrate do
    DataMapper.auto_migrate!
    puts "Auto-migrate complete (data might have been lost)"
  end
end
