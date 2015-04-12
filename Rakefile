require 'cucumber/rake/task'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'data_mapper'
RuboCop::RakeTask.new :cop
RSpec::Core::RakeTask.new :spec
Cucumber::Rake::Task.new(:cuke) do |t|
  t.cucumber_opts = "features --format pretty"
end

task default: [:auto_upgrade, :cop, :spec, :cuke]

task :auto_upgrade do
  require_relative 'app/models/data_mapper_setup'
  DataMapper.auto_upgrade!
  puts "DB upgraded"
end

task :auto_migrate do
  require_relative 'app/models/data_mapper_setup'
  DataMapper.auto_migrate!
  puts "DB migrated, may have lost data"
end

task :auto_migrate_test do
  ENV['RACK_ENV'] = 'test'
  require_relative 'app/models/data_mapper_setup'
  DataMapper.auto_migrate!
  puts "DB migrated, may have lost data"
end