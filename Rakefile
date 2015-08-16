# require 'cucumber/rake/task'
# require 'rspec/core/rake_task'
# require 'rubocop/rake_task'
require 'data_mapper'
require './data_mapper_setup'

RuboCop::RakeTask.new :cop
RSpec::Core::RakeTask.new :spec
Cucumber::Rake::Task.new :cuke

task default: [:cop, :spec, :cuke]