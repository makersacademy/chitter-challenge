
class Cheep

  include DataMapper::Resource

  property :id, Serial
  property :message, Text
  property :created, DateTime

  belongs_to :user
end
