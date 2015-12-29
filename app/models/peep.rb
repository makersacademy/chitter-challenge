class Peep

  include DataMapper::Resource

  property :id, Serial
  property :message, String
  property :created_at, Time
  property :parent_peep, String

  belongs_to :user
end
