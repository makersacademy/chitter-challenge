class Peeps
  include DataMapper::Resource

  property :id, Serial
  property :message, Text
  property :user_id, Integer
  property :created_at, DateTime
  belongs_to :user
  has n, :replys

end
