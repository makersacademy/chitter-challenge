require 'data_mapper'
require './app/data_mapper_setup'
require_relative 'app/models/user.rb'
require_relative 'app/models/peep.rb'


 
task :auto_upgrade do 
  DataMapper.auto_upgrade!
  puts "Auto-upgrade complete (no data loss)"
end

task :auto_migrate do 
  DataMapper.auto_migrate!
  puts "Auto-migrate comptlete (Data could have been lost)"
end 