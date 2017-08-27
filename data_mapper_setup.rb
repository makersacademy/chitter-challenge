require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'

require './models/post'
require './models/user'

DataMapper.setup(:default, "postgres://localhost/twitter")
DataMapper.finalize
DataMapper.auto_upgrade!
