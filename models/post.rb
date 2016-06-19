require 'dm-timestamps'

class Post

  include DataMapper::Resource

  belongs_to :user

  property :id, Serial
  property :message, String, required: true
  property :created_at, DateTime

end
