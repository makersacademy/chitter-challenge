class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, String
  property :username, String
 
  belongs_to :user

end
