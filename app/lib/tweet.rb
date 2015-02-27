class Tweet

  include DataMapper::Resource

  property :id,       Serial
  property :user,     String
  property :message,  String

end