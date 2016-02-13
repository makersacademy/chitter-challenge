require 'data_mapper'
require './app/app.rb'
require 'rspec/core/rake_task'
task :default => :spec
RSpec::Core::RakeTask.new

namespace :db do
  desc 'DataMapper functions' 
  task :upgrade do 
    DataMapper.auto_upgrade!
  end

  task :migrate do
    DataMapper.auto_migrate!
  end
end
