require 'data_mapper'


class Message
  include DataMapper::Resource



  property :id, Serial
  property :content, Text
  property :created_at, DateTime
  property :updated_at, DateTime

  
  has n, :commentMessages
  has n, :comment, :through => :commentMessages

  	
  ## handles on message 
  has n, :messagings
  has n, :users, :through => :messagings


 
  def twenty_chars 
    self.content[0...20]
  end
end
