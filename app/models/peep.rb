require 'data_mapper'

class Peep
  include DataMapper::Resource

  # has n, :tags, through: Resource

  property :id,     Serial
  property :title,  String
  property :url,    String
end

