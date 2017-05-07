if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

require 'data_mapper'
require_relative './app'
require_relative './data_mapper_setup'

namespace :db do
  desc 'Destruction of data'
  task :migrate do
    DataMapper.auto_migrate!
    puts "Data destroyed!"
  end

  desc 'Non-destruction'
  task :upgrade do
    DataMapper.auto_upgrade!
    puts "No data destroyed!"
  end
end
