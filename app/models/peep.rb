require 'data_mapper'


class Peep

  include DataMapper::Resource
  property :id, Serial
  property :body, Text , required: true
  property :created_at, DateTime
  property :username, String
  property :name, String


end
