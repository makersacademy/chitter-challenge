require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/homepage'
require_relative 'models/user'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}") #setup connection with database
DataMapper.finalize #checks everything is ok
DataMapper.auto_upgrade! #builds new columns and table we added
