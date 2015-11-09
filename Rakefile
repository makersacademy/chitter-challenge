# require 'cucumber/rake/task'
# require 'rspec/core/rake_task'
# require 'rubocop/rake_task'
#
# RuboCop::RakeTask.new :cop
# RSpec::Core::RakeTask.new :spec
# Cucumber::Rake::Task.new :cuke
#
# task default: [:cop, :spec, :cuke]
#

require 'data_mapper'
require './app/chitter.rb'

namespace :db do

  desc "Non destructive upgrade"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts "Auto upgrade complete (without data loss)"
  end

  desc "destructive upgrade"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts "Auto migrate complete (with data loss)"
  end
end
