if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  require 'sinatra/activerecord'
  require 'sinatra/activerecord/rake'
  require './app.rb'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end
