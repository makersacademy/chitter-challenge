require 'data_mapper'
require 'dm-postgres-adapter'

class Chit

  include DataMapper::Resource

  property :id,     Serial
  property :post,  String
  property :time,    String

  has n, :tags, through: Resource
  belongs_to :user
end
