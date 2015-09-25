class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :created_at, DateTime

  validates_presence_of :content
  validates_length_of :content, max: 140

  belongs_to :user
end