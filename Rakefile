require 'data_mapper'
require './app/app'


namespace :db do

  desc "clears the data within the database, data will be lost"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts "this database is clear! All your data has gone away"
  end

  desc "makes sure the database schema matches the model, no data loss"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts "the database schema matches the model, no information was lost"
  end

end
