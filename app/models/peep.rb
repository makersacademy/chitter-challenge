class Peep

  include DataMapper::Resource

  property :id, Serial
  property :message, Text
  property :time, DateTime

  belongs_to :user

end