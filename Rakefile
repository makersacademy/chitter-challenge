if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  require 'data_mapper'
  require './app/chitter'
  require './app/data_mapper_setup'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]

  namespace :db do
    desc 'Non destructive upgrade'
    task :auto_upgrade do
      DataMapper.auto_upgrade!
      puts 'Auto-upgrade complete (no data loss)'
    end

    desc 'Destructive upgrade'
    task :auto_migrate do
      DataMapper.auto_migrate!
      puts 'Auto-Migrate complete (data was lost)'
    end
  end
end
