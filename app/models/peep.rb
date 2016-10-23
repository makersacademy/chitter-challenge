class Peep
  include DataMapper::Resource

  belongs_to :user
  has n, :comments

  property :id, Serial
  property :peep_text, Text
  property :created_at, DateTime
end
