require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/user'
require_relative 'models/peep'

#set up a connection with the database
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV["RACK_ENV"]}")
#checking that everything we wrote / the way we structured it is correct
DataMapper.finalize
#build the columns and rows
DataMapper.auto_upgrade!
