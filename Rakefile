require './app/app.rb'
require './app/datamapper_setup'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

namespace :db do
  desc 'Rebuild Database Tables (data will be lost)'
  task :migrate do
    DataMapper.auto_migrate!
    puts "db:migrate complete"
  end

  desc 'Upgrade Database Tables'
  task :upgrade do
    DataMapper.auto_upgrade!
    puts "db:upgrade complete"
  end
end
