if ENV['ENVIRONMENT'] != 'production'
  require 'rspec/core/rake_task'
  require 'sinatra/activerecord'
  require 'sinatra/activerecord/rake'
  require './app/chitter'
  
  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]
end
