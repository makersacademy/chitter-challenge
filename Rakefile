require 'data_mapper'
require './app.rb'

namespace :db do
  desc "upgrade"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts "Upgraded - No data loss"
  end


  desc "Clean out"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts "Cleaned - Dat lost"
  end
end

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end
