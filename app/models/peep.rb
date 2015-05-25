class Peep

  include DataMapper::Resource

  belongs_to :User

  property :id, Serial, unique: true, message: 'ID conflict!'
  property :content, Text
  property :time, Time

  # attr_reader :id
  # attr_reader :content
  # attr_reader :time

end
