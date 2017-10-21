class Peep
  include DataMapper::Resource

  property :id, Serial
  property :contents, String
end
