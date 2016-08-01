if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  require 'data_mapper'
  require './app/app.rb'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]

  namespace :db do
    desc "Auto Migration: Tables will be dropped!"
    task :auto_migrate do
      DataMapper.auto_migrate!
      puts "Auto migration complete"
    end
    desc "Auto Upgrade"
    task :auto_upgrade do
      DataMapper.auto_upgrade!
      puts 'Auto-upgrade complete (no data loss)'
    end
  end
end
