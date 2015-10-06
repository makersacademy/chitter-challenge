require 'cucumber/rake/task'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'data_mapper'
require './data_mapper_setup'

RuboCop::RakeTask.new :cop
RSpec::Core::RakeTask.new :spec
Cucumber::Rake::Task.new :cuke

task default: [:cop, :spec, :cuke]

task :auto_upgrade do
  # auto_upgrade makes non-destructive changes.
  # if your tables don't exist, they will be created
  # but if they do and you changed your schema
  # (e.g. changed the type of one of the propertieis)
  # they will not be upgraded because that'd lead to data loss
  DataMapper.auto_upgrade!
  puts "Auto-upgrade complete (no data loss)"
end

task :auto_migrate do
  # to force the creation of all tables as they are
  # discrubed in your moldes, even if this
  #may lead to data loss, use auto_migrate:
  DataMapper.auto_migrate!
  puts "Auto-migrate complete (data could have been lost)"
end
