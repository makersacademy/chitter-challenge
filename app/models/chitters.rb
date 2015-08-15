class Chitter
  include DataMapper::Resource

  property :id, Serial
  property :text, Text
  property :created_at, DateTime
end
