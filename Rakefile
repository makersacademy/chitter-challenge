require 'cucumber/rake/task'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'data_mapper'
require './app/app.rb'

RuboCop::RakeTask.new :cop
RSpec::Core::RakeTask.new :spec
Cucumber::Rake::Task.new :cuke

task default: [:cop, :spec, :cuke]

namespace :db do
  desc "Non destructive upgrade"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts "Auto-upgrade complete (no data loss)"
  end


  desc "Destructive upgrade"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts "Auto-migrate complete (data was lost)"
  end

  desc "prepare database"
  task :chitter_setup do
    system("createdb chitter_andy_development")
    system("createdb chitter_andy_test")
    system("bundle exec rake db:auto_migrate RACK_ENV=test")
    system("bundle exec rake db:auto_migrate RACK_ENV=development")
  end
end