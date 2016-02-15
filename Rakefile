require 'data_mapper'
require './app/app.rb'

task default: :spec
begin
    require 'rspec/core/rake_task'
      RSpec::Core::RakeTask.new(:spec)
rescue LoadError
end

namespace :db do
  desc 'DataMapper functions' 
  task :upgrade do 
    DataMapper.auto_upgrade!
  end

  task :migrate do
    DataMapper.auto_migrate!
  end
end
