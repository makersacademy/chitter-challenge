require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require_relative 'lib/app'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  
  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]
end
