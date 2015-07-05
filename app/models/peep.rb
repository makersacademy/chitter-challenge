require 'data_mapper'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :message, String
  property :created_at, DateTime

  belongs_to :user

end