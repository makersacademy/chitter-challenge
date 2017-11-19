if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  require_relative 'app/app'
  require_relative 'app/models/db-setup'
  
  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]
end

namespace :db do
  task :create do
    system 'createdb chitter_test'
    system 'createdb chitter_development'
  end

  task :migrate do
    DataMapper.auto_migrate!
  end

  task :upgrade do
    DataMapper.auto_upgrade!
  end
end
