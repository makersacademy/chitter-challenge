require 'data_mapper'
require_relative 'app/app'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]

  namespace :db do
    desc 'Upgrade the database'
      task :upgrade do
        DataMapper.finalize.auto_upgrade!
        puts 'Great success'
      end

    desc 'Migrate the database'
      task :migrate do
        DataMapper.finalize.auto_migrate!
        puts 'Great success'
      end
  end
  
end
