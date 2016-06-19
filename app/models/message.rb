class Message
  include DataMapper::Resource

  has n, :replies

  property :id,         Serial
  property :message,    String
  property :email,      String
  property :created_at, DateTime

end
