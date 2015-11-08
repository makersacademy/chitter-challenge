require 'data_mapper'
require 'dm-postgres-adapter'
require './app/models/user'
require './app/models/peep'


#ENV['DATABASE_URL'] should be recognised by Heroku if the project is hosted there.
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
