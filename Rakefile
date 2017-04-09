require 'data_mapper'
require './app/app.rb'
require 'rspec/core/rake_task'

task :default => :spec
RSpec::Core::RakeTask.new


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

end
