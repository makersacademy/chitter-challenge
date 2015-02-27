class Maker

  include DataMapper::Resource

  property :id,               Serial
  property :name,             String
  property :username,         String, :unique => true
  property :email,            String, :unique => true
  property :password_digest,  Text

end