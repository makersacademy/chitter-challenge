class Peep
  include DataMapper::Resource

  property :id,         Serial
  property :message,    String
  property :created_at, Time

  belongs_to :user
end
