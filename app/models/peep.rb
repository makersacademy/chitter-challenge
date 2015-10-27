class Peep

  include DataMapper::Resource

  property :id, Serial
  property :message, Text
  property :rating, Text

  belongs_to :user


end
