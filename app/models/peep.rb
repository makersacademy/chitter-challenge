class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, Text
  property :created_at, DateTime
  property :created_on, Date
  property :updated_at, DateTime
  property :updated_on, Date

  belongs_to :user
end
