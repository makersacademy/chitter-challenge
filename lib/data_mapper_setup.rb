require 'data_mapper'
require 'dm-postgres-adapter'

require_relative './model/user'
require_relative './model/twit'

DataMapper.setup(:default, 'postgres://localhost/tweeter_development')
DataMapper.finalize
DataMapper.auto_upgrade!
