class Messagestream
  include DataMapper::Resource 
  
  property :id, Serial
  property :message, Object
  
  has n, :messages
end