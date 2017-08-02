class Peep
  include DataMapper::Resource
  attr_reader :message
  property :id, Serial
  property :message, String
  property :time, String
end
