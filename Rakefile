if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

require 'data_mapper'
require './app/chitter.rb'

namespace :dm do
  desc 'upgrade (no data loss)'
  task :upgrade do
    DataMapper.auto_upgrade!
    puts 'Database upgrade complete'
  end

  desc 'migrate (data will be lost)'
  task :migrate do
    DataMapper.auto_migrate!
    puts 'Database migration complete'
  end
end
