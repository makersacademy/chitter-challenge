require './app/app.rb'

namespace :db do
  desc "non destructive upgrade"
  task :auto_upgrade do
   DataMapper.auto_upgrade!
   puts "Auto upgrade complete (no data loss)"
  end

  desc "destructive upgrade"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts "Auto-migrate complete (all data lost)"
  end
end
