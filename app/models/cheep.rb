class Cheep
  include DataMapper::Resource
  property :id, Serial
  property :message, Text
end