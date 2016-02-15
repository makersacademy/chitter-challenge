require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'

class Peep

 include DataMapper::Resource

property	:id,         				Serial
property	:username,					String
property	:chitter,    				String

end

DataMapper.setup(:default, "postgres://localhost/peeps_test")
DataMapper.finalize
DataMapper.auto_upgrade!