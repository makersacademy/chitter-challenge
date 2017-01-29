require './app/data_mapper_setup'

class Peep

  include DataMapper::Resource

  property :id,             Serial
  property :text,           Text
  property :time,           String
  property :user_name,      String

  #has 1, :user, through: Resource

end
