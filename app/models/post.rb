class Post

  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  timestamps :created_at, :updated_on

  belongs_to :user

end
