require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'user'
# require_relative '?'

DataMapper.setup(:default,
  ENV['DATABASE_URL'] || "postgres://localhost/chitter_users_#{ENV['RACK_ENV']}")

DataMapper.finalize
DataMapper.auto_upgrade!
