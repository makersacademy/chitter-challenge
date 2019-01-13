require "./config/data_mapper"

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

#Taken from the makersBNB rakefile used this week

namespace "db" do
  desc "Truncates tables"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts "Migrated successfully"
  end

  desc "Updates tables (safely)"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts "Upgraded successfully"
  end
end
