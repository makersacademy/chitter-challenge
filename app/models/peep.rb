require 'dm-timestamps'

class Peep
  
  include DataMapper::Resource

  property :id,            Serial
  property :text,          String
  property :timestamp,     DateTime
  property :user_name,     String
  property :user_username, String

end
