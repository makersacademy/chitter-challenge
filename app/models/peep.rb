require 'data_mapper'

class Peep
  include DataMapper::Resource

  property :id,     Serial
  property :content,  String
  property :user, String
  property :time, String

end