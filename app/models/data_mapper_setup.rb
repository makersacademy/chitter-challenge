DB = 'chitter'

require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

require_relative 'chit'
require_relative 'user'

connection_string = "postgres://localhost/#{DB}_#{ENV['RACK_ENV']}"
DataMapper.setup(:default, ENV['DATABASE_URL'] || connection_string)
DataMapper::Logger.new($stdout, :debug)
DataMapper.finalize
