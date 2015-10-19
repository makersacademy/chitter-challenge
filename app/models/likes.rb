class Like
  include DataMapper::Resource

  property :id, Serial
  property :created_at, DateTime

  belongs_to :user
  belongs_to :peep
end
