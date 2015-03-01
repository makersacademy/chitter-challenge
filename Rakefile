require 'data_mapper'
require './app/server'

task :auto_upgrade do
  DataMapper.auto_upgrade!
  puts "Auto-upgrade complete (no data loss"
end

task :auto_migrate do
  DataMapper.auto_migrate!
  puts "Auto-migrate complate (data could have been lost)"
end