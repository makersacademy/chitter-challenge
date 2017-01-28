require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

require_relative './models/user'

DataMapper::Logger.new($stdout, :debug)

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_app_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
