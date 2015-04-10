require 'cucumber/rake/task'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require_relative './app/data_mapper_setup'

RuboCop::RakeTask.new :cop
RSpec::Core::RakeTask.new :spec
Cucumber::Rake::Task.new :cuke

task default: [:cop, :spec, :cuke]

task :auto_migrate do
  DataMapper.auto_migrate!
  puts "Database Migrated Data May Have Been Lost"
end

task :auto_upgrade do
  DataMapper.auto_upgrade!
  puts "Database Upgraded Data Safe"
end