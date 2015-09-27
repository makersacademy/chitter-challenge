# require 'cucumber/rake/task'
# require 'rspec/core/rake_task'
# require 'rubocop/rake_task'
require './app/data_mapper_setup'

# RuboCop::RakeTask.new :cop
# RSpec::Core::RakeTask.new :spec
# Cucumber::Rake::Task.new :cuke

# task default: [:cop, :spec, :cuke]

task :auto_migrate do
  DataMapper.setup(:default, ENV['DATABASE_URL'])
  DataMapper.auto_migrate!
  puts "migration complete (possible data loss)"
end

task :auto_upgrade do
  DataMapper.setup(:default, ENV['DATABASE_URL'])
  DataMapper.auto_upgrade!
  puts "upgrade complete (no data loss)"
end
