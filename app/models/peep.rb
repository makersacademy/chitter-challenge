class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, String
  property :time, String
  property :peeper, String

  has n, :replies

end
