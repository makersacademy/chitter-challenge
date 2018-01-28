class Peep
  include DataMapper::Resource
  property :id, Serial
  property :post, Text
  property :created_at, DateTime

  belongs_to :user
end
