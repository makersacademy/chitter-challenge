
class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :created_at, DateTime
  property :author, String

end



