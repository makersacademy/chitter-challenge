class Peep

  include DataMapper::Resource

  property :id, Serial
  property :message, Text
  property :time, DateTime
  property :personal_message_to, String
  property :personal_message_from, String

  belongs_to :user

end