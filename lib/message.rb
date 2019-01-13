require 'data_mapper'

class Message

  include DataMapper::Resource
  property :id, Serial
  property :content, Text
  property :created_at, DateTime

  def display_time
    created_at.strftime('%d-%m-%y | %H:%M:%S')
  end

end
