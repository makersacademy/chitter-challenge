require 'data_mapper'
require './app/app.rb'

namespace :db do
  desc "Non destructive upgrade"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts 'Auto-upgrade completed.(no data loss)'
  end

  desc "Destructive upgrade"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts "Auto-migrate completed.(complete data loss)"
  end
end
