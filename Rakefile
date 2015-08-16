require 'cucumber/rake/task'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'data_mapper'
require_relative 'data_mapper_setup'

RuboCop::RakeTask.new :cop
RSpec::Core::RakeTask.new :spec
Cucumber::Rake::Task.new :cuke

task default: [:cop, :spec, :cuke]

task :auto_upgrade do
  DataMapper.auto.upgrade!
  puts "Auto upgrade completed"
end

# task :auto_migrate do
#   DataMapper.auto.migrate!
#   puts "Auto migrate completed"
# end
