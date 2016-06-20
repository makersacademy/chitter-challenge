require 'data_mapper'
require './app/app.rb'

namespace :db do
  desc "Non-destructive upgragde"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts "Auto-upgrade complete (no data loss)"
  end

  desc "Destructive upgrade"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts "auto-migrate complete (data was lost)"
  end
end
