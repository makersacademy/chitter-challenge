require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/user'
require_relative 'models/peep'

DataMapper.setup(:default,"postgres://localhost/chitter")
DataMapper.finalize
DataMapper.auto_upgrade!

 # ENV['DATABASE_URL'] ||
