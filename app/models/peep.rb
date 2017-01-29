class Peep

  include DataMapper::Resource

  property :id, Serial
  property :message, String, required: true
  property :username, String
  property :created_at, DateTime

  belongs_to :user
end
