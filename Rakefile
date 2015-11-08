# require 'cucumber/rake/task'
require 'rspec/core/rake_task'
# require 'rubocop/rake_task'
require 'data_mapper'
require './app/app.rb'

# RuboCop::RakeTask.new :cop
# RSpec::Core::RakeTask.new :spec
# Cucumber::Rake::Task.new :cuke

task default: [:migrate] # [:cop, :migrate, :spec, :cuke]


desc "db auto upgrade"
task :upgrade do
  DataMapper.auto_upgrade!
  puts "TA-DA"
end
desc "db auto migrate"
task :migrate do
  DataMapper.auto_migrate!
  puts "TAAA-DAAAAAAAAA"
end
