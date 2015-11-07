require 'cucumber/rake/task'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require './app/datamapper_setup'
require './app/app.rb'

RuboCop::RakeTask.new :cop
RSpec::Core::RakeTask.new :spec
Cucumber::Rake::Task.new :cuke

task default: [:cop, :spec, :cuke]

namespace :db do
  desc 'save data into an existing database'
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    # puts 'Automatically saves data into a database'
  end

  desc 'delete all data from an existing database'
  task :auto_migrate do
    DataMapper.auto_migrate!
    # puts 'Overwrites existing database'
  end

end
