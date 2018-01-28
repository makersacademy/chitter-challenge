if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

require 'data_mapper'
require './app/app.rb'

namespace :db do
  # usage:
  #   rake -T
  #   rake db:auto_migrate
  #   rake db:auto_upgrade
  #   $ rake db:auto_upgrade RACK_ENV=test
  #   $ rake db:auto_upgrade
  #   $ heroku run rake db:auto_upgrade
  desc "Non destructive upgrade"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts "Auto-upgrade complete (no data loss)"
  end

  desc "Destructive upgrade"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts "Auto-migrate complete (data was lost)"
  end
end
