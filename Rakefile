if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  require 'data_mapper'
  require_relative './lib/app'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]

  namespace :db do
    task :migrate do
      DataMapper.auto_migrate!
      puts "Your database is fresh and clean! No old data has been kept"
    end

    task :upgrade do
      DataMapper.auto_upgrade!
      puts "Your database has been updated. Old data is still there!"
    end
  end
end
