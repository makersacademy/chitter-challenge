if ENV['RACK_ENV'] != 'production'
require 'rspec/core/rake_task'
require './app/app.rb'
require 'data_mapper'


  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

namespace :db do
  desc "Non destructive upgrade"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts "Auto-upgrade complete (data was lost)"
  end

  desc "Destructive upgrade"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts "Auto-migrate complete (data was lost)"
  end
end
