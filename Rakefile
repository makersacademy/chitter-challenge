require 'data_mapper'
require './app/chitter.rb'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

namespace :db do

  desc 'Non destructive upgrade'
  task :auto_upgrade do
    DataMapper.auto_upgrade!
  end

  desc 'Destructive upgrade'
  task :auto_migrate do
    DataMapper.auto_migrate!
  end
end
