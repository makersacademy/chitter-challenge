class Message

  include DataMapper::Resource

  belongs_to :user

  property :id, Serial
  property :peep, String
  property :time, Time

end