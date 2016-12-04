class Peep
  include DataMapper::Resource
  property :id, Serial
  property :time, Time
  property :message, Text
end
