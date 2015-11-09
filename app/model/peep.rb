class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, String
  property :username, String

  # belongs_to :user
  has n, :user, through: Resource

end
