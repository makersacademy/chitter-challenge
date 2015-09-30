class Reply
  include DataMapper::Resource

  property :id, Serial
  property :reply, Text, length: 140
  property :time, DateTime
  belongs_to :peep
  belongs_to :user

end
