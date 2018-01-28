require 'data_mapper'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

desc "Upgrades a database"
task :auto_upgrade do
  DataMapper.auto_upgrade!
  puts "database upgraded"
end

desc "Migrates a database"
task :auto_migrate do
  DataMapper.auto_migrate!
  puts "migration completed"
end
