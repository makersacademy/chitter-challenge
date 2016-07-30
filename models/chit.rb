class Chit

  include DataMapper::Resource

  attr_reader :message, :date

  property :id, Serial
  property :message, String, length: 255, required: true
  property :chitee, String
  property :date, String
  property :time, String

end
