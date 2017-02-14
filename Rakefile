require 'data_mapper'
require './app/app.rb'

namespace :db do
  desc "Destructive upgrade"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts "Auto-migrate complete!(data was lost)"
  end

  desc "Non-Destructive upgrade"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts "Auto-upgrade complete!(No data lost)"
  end
end
