class Peep
  include DataMapper::Resource

  property :author, String
  property :id, Serial
  property :content, Text#, required: true
  property :created, DateTime
end
