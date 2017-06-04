class Chit

  include DataMapper::Resource

  belongs_to :user
  
  property :id, Serial
  property :message, Text
  property :time, EpochTime
end
