require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/user'


connection_string = "postgres://localhost/chitter_challenge_#{ENV['RACK_ENV']}"
DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, ENV['DATABASE_URL'] || connection_string)
DataMapper.finalize.auto_upgrade!
