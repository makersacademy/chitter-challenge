require 'data_mapper'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :message, String
  property :created_at, DateTime
  property :created_by, String

  belongs_to :user

end