require 'data_mapper'
require_relative './app/application_controller.rb'
if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  
  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]
end

namespace :db do
  task :migrate do
    DataMapper.auto_migrate!
    puts "Auto-migrate complete (data was lost)"
  end

  task :updagrade do
    DataMapper.auto_upgrade!
    puts "Auto-upgrade complete (no data loss)"
  end
end
