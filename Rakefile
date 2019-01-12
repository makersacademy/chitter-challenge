require 'sinatra/activerecord/rake'
require './app'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  
  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]
end

namespace :db do
  task :load_config do
    require "./app"
  end
end

