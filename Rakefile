if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  require 'data_mapper'
  require './app/app.rb'

  namespace :db do

    desc "Non-destructive update"
    task :upgrade do
      DataMapper.auto_upgrade!
      puts 'Upgrade complete (no data lost)'
    end

    desc "Destructive update"
    task :migrate do
      DataMapper.auto_migrate!
      puts 'Migration complete (terminal data loss)'
    end

  end

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end
