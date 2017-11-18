require_relative 'peep'
require_relative 'user'

require 'dm-postgres-adapter'
require 'data_mapper'


DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
