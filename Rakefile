if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

require './app/app.rb'
require 'data_mapper'

task :auto_upgrade do
  DataMapper.auto_upgrade!
  DataMapper.auto_upgrade! RACK_ENV='test'
  p 'Relations Upgraded! Much Success'
end

task :auto_migrate do
  DataMapper.auto_migrate!
  p 'Relations Migrated! Much Success'
end
