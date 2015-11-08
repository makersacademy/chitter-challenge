# require 'cucumber/rake/task'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RuboCop::RakeTask.new :cop
RSpec::Core::RakeTask.new :spec
# Cucumber::Rake::Task.new :cuke

task default: [:cop, :spec, :cuke]

require 'data_mapper'
require 'dm-postgres-adapter'
require './app/app.rb'

namespace :db do
  desc "non destructive upgrade"
  task :upgrade do
    DataMapper.auto_upgrade!
    puts "Auto-upgrade complete (with no data loss)"
  end

  desc "destructive upgrade"
  task :migrate do
    DataMapper.auto_migrate!
    puts "Auto-migrate compete (data was lost)"
  end
end
