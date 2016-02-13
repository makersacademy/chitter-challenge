require_relative './app/app'
require 'data_mapper'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

namespace :db do
  desc 'Non destructive upgrade'
  task :upgrade do
    DataMapper.auto_upgrade!
    puts 'Auto-upgrade complete (no data was lost)'
  end

  desc 'Destructive upgrade'
  task :migrate do
    DataMapper.auto_migrate!
    puts 'Auto-migrate complete (data was lost)'
  end
end
