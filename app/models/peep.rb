class Peep

  include DataMapper::Resource

  has n, :comments

  property :id, Serial
  property :text, Text, required: true
  property :time, String

  belongs_to :maker

end
