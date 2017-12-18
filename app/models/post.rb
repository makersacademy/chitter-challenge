require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'

class Post
  include DataMapper::Resource
  property :id, Serial
  property :message, String
  property :created_at, DateTime # part of dm-timestamps. Updated on creation.
  belongs_to :user
end
