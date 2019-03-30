require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require './app'
# need pg here?


if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  
  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]
end


