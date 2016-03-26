if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec
  task default: [:spec]

end


require './app/dm_models_setup'

desc "dev database migration"
task :migDev do
  DataMapper.setup(:default, "postgres://localhost/chitter_development")
  DataMapper.auto_migrate!
  puts "Automigrate complete on DEV"
end

desc "test database migration"
task :migTest do
  DataMapper.setup(:default, "postgres://localhost/chitter_test")
  DataMapper.auto_migrate!
  puts "Automigrate complete on TEST"
end
