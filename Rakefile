if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  require 'sinatra/activerecord'
  require 'sinatra/activerecord/rake'
  require './app'
  
  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]
end
