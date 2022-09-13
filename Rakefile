require 'rake'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) 

namespace :db do
  desc "migrate your database"
  task :migrate do
    require 'bundler'
    Bundler.require
    require './config/environments/test'
    # ActiveRecord::Migrator.migrate('db/migrate/')
    ActiveRecord::MigrationContext.new("db/migrate/").migrate
  end
end

task :default  => :spec