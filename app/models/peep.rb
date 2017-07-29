require './app/data_mapper_setup'

class Peep
  include DataMapper::Resource

  belongs_to :user

  property :id,        Serial
  property :message,     Text
  #property :time,    DateTime

end
