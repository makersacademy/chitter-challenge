require 'data_mapper'
require './app/data_mapper_setup'
require './models/peep'
require './models/user'
require 'server'

task :auto_upgrade do
  DataMapper.auto_upgrade!
  puts "Auto-upgrade complete (no data loss)"
end

task :auto_migrate do
  DataMapper.auto_migrate!
  puts "Auto-migrate complete (data could have been lost)"
end