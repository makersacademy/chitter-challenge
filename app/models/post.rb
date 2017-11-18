ENV['RACK_ENV'] = 'test'

require 'data_mapper'
require 'dm-postgres-adapter'

class Post
  include DataMapper::Resource

  property :id,      Serial
  property :title,   String
  property :post,    String
  property :name,    String

end

DataMapper.setup(:default, "postgres://localhost/chitter")
DataMapper.finalize
DataMapper.auto_upgrade!
