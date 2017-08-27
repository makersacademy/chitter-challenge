require 'data_mapper'
require 'dm-migrations'
require 'dm-timestamps'


class Peep
  include DataMapper::Resource

  #has n, :tags, through: Resource

  property :id,    Serial
  property :content, String
  property :created_at, DateTime
end
