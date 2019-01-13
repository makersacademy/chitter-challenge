require './config/data_mapper'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:migration, :spec]
end

namespace "db" do
  desc 'Truncates tables'
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts "Migrated successfully"
  end

  desc 'Updates tables'
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts "Upgraded successfully"
  end
end

task :migration => ["db:auto_migrate"]
