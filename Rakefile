if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
end #is this supposed to be an if statement? check if errors are thrown.

require 'data_mapper'
require_relative './app/app.rb'

RSpec::Core::RakeTask.new :spec

task default: [:spec]

namespace :db do
  desc "Non destructive upgrade"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts "Auto-upgrade complete (no data loss)"
  end


  desc "Destructive upgrade"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts "Auto-migrate complete (data was lost)"
  end
end
