class Message

  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :date_time, Time
  property :text, Text

  belongs_to :sender, 'User'
  belongs_to :reciver, 'User'

end