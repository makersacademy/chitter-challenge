require 'data_mapper'

namespace :db do
  task :upgrade do
    DataMapper.auto_upgrade!
    puts "Auto-upgrade complete (no data loss)"
  end

  task :migrate do
    DataMapper.auto_migrate!
    puts "Auto-migrate complete (no data loss)"
  end
end

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end
