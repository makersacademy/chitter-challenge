require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

  include DataMapper::Resource

  property :id,     Serial 
  property :peep,  String
  property :created_at, DateTime
 
end

DataMapper.setup(:default, "postgres://namitha:root@localhost/peep_manager_test")
DataMapper.finalize
DataMapper.auto_upgrade!