class Peep
  include DataMapper::Resource
  belongs_to :user

  property :id, Serial
  property :body, String, :length => 140
  property :created_at, Time
end
