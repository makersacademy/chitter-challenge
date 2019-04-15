if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  require 'sinatra/activerecord'
  require 'sinatra/activerecord/rake'
  require './app/chitter'
  require './config/environment'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]

  namespace :db do
    desc 'migrate changes to db'
    task migrate: do
      chi
    end
  end

end
