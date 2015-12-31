class Peep
  include DataMapper::Resource

  belongs_to :user

  property :id, Serial
  property :content, Text, :length => 1..140
end
