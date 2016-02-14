require 'data_mapper'
require './app.rb'

namespace :db do
  desc "Non destructive upgrade"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts "Auto Upgrade Complete - No Data Loss"
  end

  desc "Destructive upgrade"
  task :auto_migrate do
      DataMapper.auto_migrate!
      puts "Auto-migrate Compete - Data lost..."
  end
end
