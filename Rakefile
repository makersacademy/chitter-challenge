
require 'rspec/core/rake_task'
require 'data_mapper'
require './app/app.rb'


  RSpec::Core::RakeTask.new :spec
  #Cucumber::Rake::Task.new :cuke


 task default: [:cop, :spec, :cuke]

 namespace :db do
   desc 'save data into an existing database'
   task :auto_upgrade do
   DataMapper.auto_upgrade!

   end

   desc 'delete all data from an existing database'
   task :auto_migrate do
   DataMapper.auto_migrate!

  end

 end
