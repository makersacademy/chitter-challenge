if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  require './app/app'
  require 'sinatra/activerecord/rake'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end
