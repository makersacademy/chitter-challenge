require 'data_mapper'
require './app/app.rb'

namespace :db do
  desc "Non-destructive upgrade"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts "Auto-upgrade complete. No data loss."
  end

  desc "Destructive upgrade"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts "Auto-migrate complete. Database schema was reubuilt, and all existing data was lost."
  end

end
