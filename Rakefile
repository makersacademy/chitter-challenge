require 'data_mapper'
require './app/app.rb'


namespace :db do
  desc "non destructive upgrade"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts "Database upgraded!"
  end

  desc "destructive upgrade"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts "Database migrated!"
  end
end
