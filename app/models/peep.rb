class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, Text
  property :posted_at, String

  belongs_to :user
end