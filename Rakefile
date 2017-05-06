require 'data_mapper'
require File.join(File.dirname(__FILE__), 'app.rb')

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  
  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]
end

namespace :db do
  desc "Auto upgrade"
  task :upgrade do
    DataMapper.auto_upgrade!
    puts "Auto-upgrade complete (no data removed)"
  end

  desc "Destructive upgrade"
  task :migrate do
    DataMapper.auto_migrate!
    puts "Auto-migrate complete (data wiped)"
  end
end
