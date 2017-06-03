class Peep
  include DataMapper::Resource
  property :id,         Serial
  property :name,       String
  property :username,   String
  property :message,    String
  property :created_at, DateTime
end
