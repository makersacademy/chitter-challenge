require './app/dm_models_setup'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec
  task default: [:spec]

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

else

  desc "production database migration"
  task :migPro do
    DataMapper.setup(:default, ENV['DATABASE_URL'])
    DataMapper.auto_migrate!
    puts "Automigrate complete on #{ENV['DATABASE_URL']}"
  end

end
