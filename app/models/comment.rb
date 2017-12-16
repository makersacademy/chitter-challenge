require 'data_mapper'
require 'dm-postgres-adapter'

DataMapper.setup(:default, "postgres://localhost/chitter")

class Comment

  time = Time.now.strftime("%d/%m/%Y %H:%M")

  include DataMapper::Resource

  property :id,       Serial
  property :comment,  Text 
  property :created_at, String,  :default => time

end


DataMapper.finalize
DataMapper.auto_upgrade!
