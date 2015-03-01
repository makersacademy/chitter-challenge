class Peep

  include DataMapper::Resource

  property :id,   Serial
  property :time,   DateTime
  property :text,  Text

end
