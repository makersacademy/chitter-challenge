class Peep
  include DataMapper::Resource
  property :id, Serial
  property :peep, String, length: 140
  property :username, String
  property :created_at, DateTime
  # belongs_to :user
end
