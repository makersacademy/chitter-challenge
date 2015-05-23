require 'cucumber/rake/task'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'data_mapper'
require 'database_cleaner'
require './app/server'

RuboCop::RakeTask.new :cop
RSpec::Core::RakeTask.new :spec
Cucumber::Rake::Task.new :cuke

task default: [:cop, :spec, :cuke]

task :auto_upgrade do
  # auto_upgrade makes non-destructive changes.
  # If your tables don't exist, they will be created
  # but if they do and you changed your schema
  # (e.g. changed the type of one of the properties)
  # they will not be upgraded because that'd lead to data loss.
  DataMapper.auto_upgrade!
  puts 'Auto-upgrade complete (no data loss)'
end

task :auto_migrate do
  # To force the creation of all tables as they are
  # described in your models, even if this
  # may lead to data loss, use auto_migrate:
  DataMapper.auto_migrate!
  puts 'Auto-migrate complete (data could have been lost)'
end

task :database_cleaner do
  DatabaseCleaner.strategy = :transaction
  DatabaseCleaner.clean_with(:truncation)
  DatabaseCleaner.start
  puts 'Database cleaned'
end