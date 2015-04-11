class Applause
  include DataMapper::Resource
  property :id, Serial
  has 1, :cheep
  has 1, :user
end