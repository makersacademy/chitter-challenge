class Peep

  include DataMapper::Resource

  validates_length_of :message, min: 1, max: 140

  property :id, Serial
  property :message, Text
  property :time, DateTime
  property :receiver, String
  property :sender, String

  belongs_to :user

end