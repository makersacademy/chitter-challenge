require './config/data_mapper'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  
  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]
    
end

namespace :db do
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts "Upgrade complete"
  end

  task :auto_migrate do
    DataMapper.auto_migrate!
    puts "Migration complete"
  end
end
