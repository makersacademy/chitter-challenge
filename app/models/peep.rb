require 'data_mapper'

class Peep
  include DataMapper::Resource

  # has n, :tags, through: Resource

  property :id,     Serial
  property :message,  String
  property :timestamp, Time

  belongs_to :user
end

