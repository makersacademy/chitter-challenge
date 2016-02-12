require 'data_mapper'
require_relative 'app/app.rb'

namespace :db do
  desc 'DataMapper functions' 
  task :upgrade do 
    DataMapper.auto_upgrade!
  end

  task :migrate do
    DataMapper.auto_migrate!
  end
end

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  
  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]
end
