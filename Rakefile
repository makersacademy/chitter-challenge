
require 'data_mapper'
require './app/data_mapper_setup'
require './app/server'

if ENV['RACK_ENV'] == 'test'
  require 'cucumber/rake/task'
  require 'rspec/core/rake_task'
  require 'rubocop/rake_task'
  require 'database_cleaner'

  RuboCop::RakeTask.new :cop
  RSpec::Core::RakeTask.new :spec
  Cucumber::Rake::Task.new :cuke
end

task default: [:cop, :spec, :cuke]

task :auto_upgrade do

  DataMapper.auto_upgrade!
  puts 'Auto-upgrade complete (no data loss)'
end

task :auto_migrate do

  DataMapper.auto_migrate!
  puts 'Auto-migrate complete (data could have been lost)'
end