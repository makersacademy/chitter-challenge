require './lib/new_message.rb'
require 'pry'
require 'dm-postgres-adapter'

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")

DataMapper.finalize

# if ENV['RACK_ENV'] == 'development'
#   DataMapper.auto_upgrade! 
# else
#   DataMapper.auto_migrate! 
# end 