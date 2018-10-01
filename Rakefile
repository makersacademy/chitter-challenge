require_relative './data_mapper_setup'

if ENV['RACK_ENV'] != 'development'
  require 'rspec/core/rake_task'
  
  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]
end
