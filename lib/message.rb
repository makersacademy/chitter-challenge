require 'data_mapper'

class Message
  include DataMapper::Resource

  property :id, Serial
  property :peep, String
  property :username, Text
  property :created_at, DateTime

  def time
    created_at.strftime("%v %R")
  end
end
