require_relative 'app/app'
require_relative 'app/models/data_mapper_setup'

if ENV['RACK_ENV'] != 'production'
require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

task :auto_upgrade do
  DataMapper.auto_upgrade!
end

task :auto_migrate do
  DataMapper.auto_migrate!
end
