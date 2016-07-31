class Peep
  include DataMapper::Resource

  belongs_to :user

  property :id,   Serial
  property :time, DateTime
  property :body, Text

end
