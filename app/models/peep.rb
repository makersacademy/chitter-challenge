class Peep

  include DataMapper::Resource

  property :id, Serial
  property :text, Text
  property :time, String

  belongs_to :maker

end
