# if ENV['RACK_ENV'] != 'production'
#   require 'rspec/core/rake_task'
#
#   RSpec::Core::RakeTask.new :spec
#
#   task default: [:spec]
# end


# require "data_mapper"
require "./app/app.rb"


namespace :database_maintenance do

  desc 'Upgrade the database'
    task :auto_upgrade do
      DataMapper.auto_upgrade!
      puts "Database Upgraded"
    end


  desc 'Migrate the database'
    task :auto_migrate do
      DataMapper.auto_migrate!
      puts "Database Migrated"
    end

end
