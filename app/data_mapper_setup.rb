require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/comment'
require_relative 'models/user'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter")
DataMapper.finalize
DataMapper.auto_upgrade!