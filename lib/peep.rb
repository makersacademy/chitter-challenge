class Peep
  include DataMapper::Resource

  property :id, Serial
  property :text, String, :length => 120
  property :created_at, DateTime

end
