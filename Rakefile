require 'cucumber/rake/task'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require './app/data_mapper_setup'

task :auto_migrate do
  DataMapper.auto_migrate!
  puts 'Auto-migrate done'
end

RuboCop::RakeTask.new :cop
RSpec::Core::RakeTask.new :spec
Cucumber::Rake::Task.new :cuke

task default: [:cop, :spec, :cuke]
