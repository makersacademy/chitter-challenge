if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]

  require 'data_mapper'
  require './app/data_mapper_setup'

  namespace :db do
    task :auto_upgrade do
      DataMapper.auto_upgrade!
      puts 'Auto-upgrade complete (No data loss)'
    end

    task :auto_migrate do
      DataMapper.auto_migrate!
      puts 'Auto-migrate complete (Data was lost)'
    end
  end
end
