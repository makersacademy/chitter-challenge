class Peep
  include DataMapper::Resource
  property :id,       Serial
  property :name,     String
  property :username, String
  property :message,  String
  # TODO alternatively should the message property be a string so posts can't be more than 50 chars ?
end
