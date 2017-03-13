class Peep
  include DataMapper::Resource
  property :id, Serial
  property :peep_body, Text
  property :created_at, DateTime

  belongs_to :user
end
