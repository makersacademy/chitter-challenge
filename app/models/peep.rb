class Peep

  include DataMapper::Resource

  property :id,     Serial # Serial means that it will be auto-incremented for every record
  property :peep,   Text

end
