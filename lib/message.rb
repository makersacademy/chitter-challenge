require 'data_mapper'

class Message

  include DataMapper::Resource

  property :id,         Serial
  property :content,    Text
  property :created_at, DateTime

  belongs_to :user,  :key => true

  def timestamp
    created_at.strftime("%d-%m-%y %H:%M:%S")
  end

end