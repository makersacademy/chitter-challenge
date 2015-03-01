class Cheet

  include DataMapper::Resource

  property :id,   Serial
  property :text, Text
  property :time, String # string for now

end