class Peep
  include DataMapper::Resource

  property :id, Serial
  property :text, Text
  property :created_at, Time

  belongs_to :user
end
