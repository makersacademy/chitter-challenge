class Peep

  include DataMapper::Resource

  property :id, Serial
  property :title, Text
  property :body, Text
  property :created_at, Time

  belongs_to :user

end