require 'data_mapper'
require './app/app.rb'

namespace :db do
  desc 'Non destructive upgrade'
  task :auto_upgrade do
    DataMapper.auto_upgrade! do
    puts 'Auto Upgrade Complete (no Data loss)'
  end
 end
  
  desc 'Destructive upgrade'
  task :auto_migrate do
    DataMapper.auto_migrate! do
    puts 'Auto Migrate Complete (Data was lost)'
  end
 end
end
