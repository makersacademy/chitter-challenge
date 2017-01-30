if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end


require 'data_mapper'
require './app/app.rb'

namespace :db do
  desc "TEST Non destructive upgrade"
  task :auto_upgrade_test do
    ENV['RACK_ENV'] = 'test'
    p ENV['RACK_ENV']
    DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_app_#{ENV['RACK_ENV']}")
    DataMapper.finalize
    DataMapper.auto_upgrade!
    puts "Auto-upgrade complete (no data loss)"
  end


  desc "TEST Destructive upgrade"
  task :auto_migrate_test do
    ENV['RACK_ENV'] = 'test'
    p ENV['RACK_ENV']
    DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_app_#{ENV['RACK_ENV']}")
    DataMapper.finalize
    DataMapper.auto_migrate!
    puts "Auto-migrate complete (data was lost)"
  end

  desc "DEV Non destructive upgrade"
  task :auto_upgrade_dev do
    ENV['RACK_ENV'] = 'development'
    p ENV['RACK_ENV']
    DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_app_#{ENV['RACK_ENV']}")
    DataMapper.finalize
    DataMapper.auto_upgrade!
    puts "Auto-upgrade complete (no data loss)"
  end


  desc "DEV Destructive upgrade"
  task :auto_migrate_dev do
    ENV['RACK_ENV'] = 'development'
    p ENV['RACK_ENV']
    DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_app_#{ENV['RACK_ENV']}")
    DataMapper.finalize
    DataMapper.auto_migrate!
    puts "Auto-migrate complete (data was lost)"
  end

  desc "PROD Non destructive upgrade"
  task :auto_upgrade_prod do
    DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_app_#{ENV['RACK_ENV']}")
    DataMapper.finalize
    DataMapper.auto_upgrade!
    puts "Auto-upgrade complete (no data loss)"
  end


  desc "PROD Destructive upgrade"
  task :auto_migrate_prod do
    DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_app_#{ENV['RACK_ENV']}")
    DataMapper.finalize
    DataMapper.auto_migrate!
    puts "Auto-migrate complete (data was lost)"
  end

end
