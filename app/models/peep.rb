class Peep
  include DataMapper::Resource

  property :id,         Serial
  property :text,       Text, :length => 10..140, :message => "Please make sure your peep has between 10 and 140 chars"
  property :created_at, DateTime

  belongs_to :user
  has n, :comments
  
end
