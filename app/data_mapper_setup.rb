require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/user'

# set up a connection with the database
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV["RACK_ENV"]}")

# checking that everything we wrote / the way we structured it is correct
DataMapper.finalize

# build the columsn and rows
DataMapper.auto_upgrade!
