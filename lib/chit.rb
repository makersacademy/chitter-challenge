class Chit

include DataMapper::Resource

  property :id,         Serial
  property :username,  String
  property :text,       String
  

end