require 'data_mapper'
require './app/app.rb'

task default: %w[db:upgrade]

namespace :db do
  desc "Non desctructive upgrade"
  task :upgrade do 
    DataMapper.auto_upgrade!
    puts "Auto-upgrade complete (no data loss)"
  end

  desc "Destructive upgrade"
  task :migrate do 
    DataMapper.auto_migrate!
    puts "Auto-migrate complete (data was lost)"
  end

end
