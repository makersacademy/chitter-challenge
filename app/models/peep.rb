require './data_mapper_setup'

class Peep

  include DataMapper::Resource

  property :id,          Serial
  property :message,     String
  property :timestamp,   DateTime

  belongs_to :user, key: true

end