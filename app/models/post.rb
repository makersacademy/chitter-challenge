require 'data_mapper'

class Post

  include DataMapper::Resource

  property :id, Serial

  property :message, Text
  property :created_at, DateTime

  # belongs_to :user

end
