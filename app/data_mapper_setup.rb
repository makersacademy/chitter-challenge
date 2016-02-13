require 'data_mapper'
require 'dm-postgres-adapter'

require_relative './models/link'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://#{ENV['USER']}@localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
