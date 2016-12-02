require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/user'

ENV['DATABASE_URL'] ||= "postgres://localhost/chitter_#{ENV['RACK_ENV']}"
DataMapper.setup(:default, ENV['DATABASE_URL'])
DataMapper.finalize
DataMapper.auto_upgrade!
