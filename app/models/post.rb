require 'data_mapper'

class Post

  include DataMapper::Resource

  property :id, Serial
  # property :username, String
  property :message, Text, required: true
  property :created_at, DateTime

  belongs_to :user

end
