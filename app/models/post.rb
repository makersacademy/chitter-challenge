require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'
require 'dm-validations'

class Post
  include DataMapper::Resource

  property :id,         Serial
  property :post,       Text, :length => 1..140
  property :user_id,    String
  property :created_at, DateTime

  belongs_to :user
end
