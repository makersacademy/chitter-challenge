require 'data_mapper'
require 'dm-postgres-adapter'

class Post

  include DataMapper::Resource

  property :id,     Serial
  property :username,  String
  property :tweet,    String
  property :time, DateTime

end

DataMapper.setup(:default, "postgres://localhost/twitter")
DataMapper.finalize
DataMapper.auto_upgrade!
