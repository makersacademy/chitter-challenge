class Peep

  include DataMapper::Resource

  property :id, Serial
  property :peep, String
  property :time, String

  belongs_to :maker

end
