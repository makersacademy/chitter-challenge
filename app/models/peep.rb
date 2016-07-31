class Peep
  include DataMapper::Resource

  property :id,       Serial
  property :content,  String
  property :username, String
  property :name,     String
  property :created,  DateTime

end
