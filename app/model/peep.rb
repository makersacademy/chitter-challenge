require 'data_mapper'

class Peep
  include DataMapper::Resource

  property :id,         Serial
  property :body,       String,   required: true
  property :created_at, DateTime

  belongs_to :user, required: true
end
