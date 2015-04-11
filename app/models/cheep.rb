class Cheep
  include DataMapper::Resource
  property :id, Serial
  property :message, Text
  property :time_stamp, Time
  property :applause, Integer, default: 0
  has 1, :user, through: Resource
end