class Peep
  include DataMapper::Resource
  belongs_to :user

  property :id, Serial
  property :body, String
  property :created_at, Time
end
