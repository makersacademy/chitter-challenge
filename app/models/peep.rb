class Peep

  include DataMapper::Resource
  property :id,     Serial 
  property :message,  String
  property :created_at, DateTime

end