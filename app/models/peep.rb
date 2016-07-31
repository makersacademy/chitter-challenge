class Peep
  include DataMapper::Resource

  belongs_to :user

  property :id, Serial
  property :message, String,  length: 160
  property :created_at, DateTime
end
