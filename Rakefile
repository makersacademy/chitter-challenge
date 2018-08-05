if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  require 'dm-core'
  require './lib/data_mapper_setup'
  
  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]

  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts 'Auto-upgrade complete. Data is safe and sound.'
  end
   
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts 'Auto-migrate complete. Data could have been lost.'
  end
end
