if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  require 'data_mapper'
  require './app/data_mapper_setup'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]

  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts 'Auto-upgrade complete (no data loss)'
  end

  task :auto_migrate do
    DataMapper.auto_migrate!
    puts 'Auto-migrate complete (data could have been lost)'
  end
end
