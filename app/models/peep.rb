class Peep

  include DataMapper::Resource

  has n, :makers, through: Resource

  property :id, Serial
  property :text, Text
  property :time, String

end
