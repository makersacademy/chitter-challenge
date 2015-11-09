class Peep

  include DataMapper::Resource

  property :id, Serial
  property :time, DateTime
  property :message, Text

  belongs_to :user
end