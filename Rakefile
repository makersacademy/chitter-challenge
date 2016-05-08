<<<<<<< HEAD
require 'data_mapper'
require './app/app.rb'

namespace :db do
  task :default => :test
  
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
=======
if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  
  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]
>>>>>>> 240efd897c01c9e55dcddbe390d78ab5da47565c
end
