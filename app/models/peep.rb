require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
include DataMapper::Resource

property  :id,          Serial
property  :name,        String
property  :message,     String
property  :created_at,  DateTime

end
DataMapper.setup(:default, "postgres://postgres:password@localhost/chitter_db_test")
DataMapper.finalize
DataMapper.auto_upgrade!
