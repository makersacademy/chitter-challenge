class Chit
  include DataMapper::Resource

  # has n, :time, :through => Resource

  property :id, Serial
  property :words, String
  property :created_at, Date

end
