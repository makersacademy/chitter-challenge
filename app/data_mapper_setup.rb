require 'data_mapper'
require 'dm-postgres-adapter'

ENV['DATABASE_URL'] ||= "postgres://localhost/chitter_#{ENV['RACK_ENV']}"
DataMapper.setup(:default, ENV['DATABASE_URL'])

require_relative 'models/user'
require_relative 'models/peep'

DataMapper.finalize
DataMapper.auto_upgrade!
