require "data_mapper"
require "dm-validations"
require "dm-postgres-adapter"
require 'bcrypt'
require "./model/message"
require "./model/user"


DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_chatter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
