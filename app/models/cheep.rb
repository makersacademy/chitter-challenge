class Cheep

  include DataMapper::Resource

  property :id, Serial
  property :message, Text, required: true
  property :created, DateTime

  belongs_to :user
end
