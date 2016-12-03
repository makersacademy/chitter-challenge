require "data_mapper"
require "./app/app.rb"

namespace :db do
  desc "non destructive upgrade"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts "auto upgrade complete: No data lost :)"
  end

  desc "destructive upgrade"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts "auto migrate complete: data was lost :("
  end
end
