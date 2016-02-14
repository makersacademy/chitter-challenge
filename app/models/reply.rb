class Reply
  include DataMapper::Resource

  property :id,         Serial
  property :reply,      Text
  property :time_stamp, Time

  belongs_to :peep
end
