class Peep
  include DataMapper::Resource

  property :id,         Serial
  property :text,       Text, :length => 10..140, :message => "Chars between 10 and 140"
  property :created_at, DateTime

  belongs_to :user

end
