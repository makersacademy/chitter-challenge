require 'data_mapper'

class Message
  include DataMapper::Resource

  property :id, Serial
  property :text, Text, :length => 140
  belongs_to :user
end


