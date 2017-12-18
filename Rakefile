require 'data_mapper'
require './app/app.rb'

namespace :database do
  desc 'auto upgrade'
  task :upgrade do
    DataMapper.auto_upgrade!
    puts "Auto-upgrade complete (no data loss)"
  end
  desc 'auto migrate'
  task :migrate do
    DataMapper.auto_migrate!
    puts "Auto-migrate complete (data was lost)"
  end
end
