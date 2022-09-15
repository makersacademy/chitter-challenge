require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) 

namespace :db do
  namespace :test do
    desc "migrate and seed your database"
    task :migrate do
      require 'bundler'
      Bundler.require
      require './config/environments/test'
      ActiveRecord::MigrationContext.new("db/migrate/").migrate
    end
    task :seed do
      require './config/environments/test'
      require './db/seed'
    end
  end

  namespace :dev do
    desc "migrate and seed your database"
    task :migrate do
      require 'bundler'
      Bundler.require
      require './config/environments/development'
      ActiveRecord::MigrationContext.new("db/migrate/").migrate
    end
  end

end

task :default  => :spec