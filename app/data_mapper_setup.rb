require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'

require_relative 'models/peep'
require_relative 'models/tag'
require_relative 'models/user'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitterz_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_migrate!
