require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'modles/peep'

DataMapper.setup(:default, "postgres://localhost/Chitter")
DataMapper.finalize
DataMapper.auto_upgrade!
