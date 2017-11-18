require 'data_mapper'
require './app/app.rb'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

namespace :db do
  desc "non destructive upgrade"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts 'Auto upgrade complete, no data lost.'
  end

  desc "destructive upgrade"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts 'Auto upgrade complete, all data lost.'
  end
end
