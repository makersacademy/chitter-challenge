require 'data_mapper'

class Peep
  include DataMapper::Resource

  property :id        , Serial
  property :username  , String
  property :body      , Text, length: 1..280
  property :created_at, DateTime

  belongs_to :user

end
