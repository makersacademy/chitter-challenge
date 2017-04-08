class Post

  include DataMapper::Resource

  property :id, Serial
  property :content, String
  timestamps :created_at, :updated_on

  belongs_to :user

end
