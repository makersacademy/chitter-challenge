require 'data_mapper'
require './app/chitter_web.rb'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

namespace :db do
  desc 'Auto Upgrade - non-destructive'
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts 'Auto-upgrade complete. No data destroyed.'
  end

  desc 'Auto Migrate - destructive'
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts 'Auto-migrate complete. Data destroyed.'
  end
end