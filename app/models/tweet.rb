require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'


class Tweet
  include DataMapper::Resource

  property :id,           Serial
  property :message,      String
  property :created_at,   DateTime

  def time_posted
    created_at.strftime("%A, %d %b %Y %l:%M %p")
  end

end
