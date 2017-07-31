class Peep

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :copy, String
  property :created_at, DateTime

end
