class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :timestamp, String

  belongs_to :user

end