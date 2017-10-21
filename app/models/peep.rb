class Peep
  include DataMapper::Resource

  property :id, Serial
  property :contents, Text
end
