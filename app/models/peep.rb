require './app/data_mapper_setup'

class Peep

  include DataMapper::Resource

  property :id,             Serial
  property :text,           Text
  property :time,           String
  property :user_name,      String
  property :user_pic,       Integer

  #has 1, :user, through: Resource

end
