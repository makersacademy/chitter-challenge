# require 'cucumber/rake/task'
# require 'rspec/core/rake_task'
# require 'rubocop/rake_task'
require 'data_mapper'
require './app/app.rb'

# RuboCop::RakeTask.new :cop
# RSpec::Core::RakeTask.new :spec
# Cucumber::Rake::Task.new :cuke
#
# task default: [:cop, :spec, :cuke]

task default: %w[db:upgrade]

namespace :db do
  desc "Non desctructive upgrade"
  task :upgrade do
    DataMapper.auto_upgrade!
    puts "Auto-upgrade complete (no data loss)"
  end

  desc "Destructive upgrade"
  task :migrate do
    DataMapper.auto_migrate!
    puts "Auto-migrate complete (data was lost)"
  end

end
