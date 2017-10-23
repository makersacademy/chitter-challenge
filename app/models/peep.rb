class Peep
  include DataMapper::Resource

  property :id, Serial
  property :contents, Text
  property :time, Time
end
