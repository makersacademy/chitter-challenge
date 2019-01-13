require "sinatra/activerecord/rake"

namespace :db do
  task :load_config do
    require "./app"
    puts 'Config loaded from app successfully'
  end
end

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end
