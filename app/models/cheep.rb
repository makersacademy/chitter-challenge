class Cheep
  include DataMapper::Resource
  property :id, Serial
  property :message, Text
  property :time_stamp, Time
  has 1, :user, through: Resource
  property :applause, Integer, default: 0
end