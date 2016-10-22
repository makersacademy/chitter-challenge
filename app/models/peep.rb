class Peep
  include DataMapper::Resource

  belongs_to :user

  property :id, Serial
  property :peep_text, Text
  property :created_at, DateTime
end
