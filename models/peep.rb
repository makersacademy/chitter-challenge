class Peep

  include DataMapper::Resource

  property :id,         Serial
  property :user,       String
  property :content,    String
  property :created_at, DateTime

end
