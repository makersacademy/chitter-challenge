class Peep

  include DataMapper::Resource

  property :id, Serial
  property :peep, Text

  #has n, :users, through: Resource


end
