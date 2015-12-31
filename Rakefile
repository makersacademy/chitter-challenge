require 'data_mapper'
require 'dm-postgres-adapter'
require './app/app.rb'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

namespace :db do
  ENV['RACK_ENV'] ||= 'development'
  desc "Non destructive upgrade"
  task :auto_upgrade! do
    DataMapper.auto_upgrade!
    puts "Auto-upgrade complete (no data loss)"
  end

  desc "Destructive upgrade"
  task :auto_migrate! do
    DataMapper.auto_migrate!
    puts "Auto-migrate complete (data was lost)"
  end

end
