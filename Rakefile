require 'data_mapper'
require './app/app.rb'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

desc "upgrade"
task :upgrade do
  DataMapper.auto_upgrade!
  puts 'auto-upgrade complete'
end

desc "migrate"
task :migrate do
  DataMapper.auto_migrate!
  puts 'auto-migrate complete'
end
