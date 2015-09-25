
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RuboCop::RakeTask.new :cop
RSpec::Core::RakeTask.new :spec


task default: [:cop, :spec, :cuke]

require "data_mapper"

task :auto_migrate do
  DataMapper.auto_migrate!
  puts "Complete"
end