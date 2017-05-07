require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'

class Post
  include DataMapper::Resource

  property :id,       Serial
  property :post,     Text,    :length => 140
  property :user_id,  String
  belongs_to :user
end
