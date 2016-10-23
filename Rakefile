require 'data_mapper'
require './app/app'
require './app/data_mapper_setup'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  task :default => :spec
  RSpec::Core::RakeTask.new :spec

namespace :db do
  desc "Non destructive upgrade"
  task :auto_upgrade do#[:spec]
    DataMapper.auto_upgrade!
    puts 'Auto-upgrade complete (no data loss)'
  end

  desc "Destructive upgrade"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts 'Auto-migrate complete (data could have been lost)'
  end
end
end
