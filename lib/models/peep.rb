class Peep

  include DataMapper::Resource

  property :id, Serial
  property :message, Text

  has n,  :users, :through => Resource

end