class Peep

  include DataMapper::Resource

  has n, :comments

  property :id, Serial
  property :text, Text, required: true
  property :time, Time

  belongs_to :maker

end
