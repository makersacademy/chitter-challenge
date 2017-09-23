require 'data_mapper'
require 'dm-postgres-adapter'

class Post
  include DataMapper::Resource

  property :id, Serial
  property :body, String
  property :created_at, DateTime

end

DataMapper.setup(:default, "postgres://localhost/blabber_test")

DataMapper.finalize

DataMapper.auto_upgrade!
