class Peep

  include DataMapper::Resource

  validates_length_of :message, :min => 1, :max => 140

  property :id, Serial
  property :message, Text
  property :time, DateTime
  property :personal_message_to, String
  property :personal_message_from, String

  belongs_to :user

end