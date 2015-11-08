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
    desc "Non destrcutive upgrade"
    task :auto_upgrade do
      DataMapper.auto_upgrade!
      puts "Auto-upgrade complete (no data loss)"
    end


    desc "Destructive upgrade"
    task :auto_mirgate do
      DataMapper.auto_mirgate!
      puts "Auto-migrate complete (data was lost)"
    end
  end
