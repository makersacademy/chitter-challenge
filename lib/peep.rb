class Peep

  include DataMapper::Resource

  property :peep_id, Serial
  property :peep, String

end