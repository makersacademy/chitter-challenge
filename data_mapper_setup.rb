require 'data_mapper'
require 'dm-postgres-adapter'
require './models/user'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
#Checks that everything works - An error should come up in the terminal if something is incorrect
DataMapper.finalize
#Builds the table according to our previous code
DataMapper.auto_upgrade!
