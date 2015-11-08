require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'data_mapper'
require './app/app.rb'

RuboCop::RakeTask.new :cop
RSpec::Core::RakeTask.new :spec

task default: [:cop, :spec]

namespace :db do
  desc "Non desctructive upgrade"
  task :dm_upgrade do
    DataMapper.auto_upgrade!
    puts "Auto-upgrade complete (no data loss)"
  end

  desc "Destructive upgrade"
  task :dm_migrate do
    DataMapper.auto_migrate!
    puts "Auto-migrate complete (data was lost)"
  end
end
