class Peep
  include DataMapper::Resource

  property :id,         Serial
  property :text,       String
  property :created_at, DateTime

  belongs_to :user

end
