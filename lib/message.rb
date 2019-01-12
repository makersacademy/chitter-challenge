require 'data_mapper'

class Message
  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :created_at, DateTime
  property :updated_at, DateTime

  #has n, :comments,
  
  def twenty_chars 
    self.content[0...20]
  end
end
