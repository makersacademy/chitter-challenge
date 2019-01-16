require 'data_mapper'
require_relative './user_mentioned'


class Message
  include DataMapper::Resource
  include UsersMentioned
  property :id, Serial
  property :content, Text
  property :created_at, DateTime
  property :updated_at, DateTime

  has n, :comments
  belongs_to :user

 
  def twenty_chars 
    self.content[0...20]
  end
end
