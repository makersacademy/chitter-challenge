class Cheep

  include DataMapper::Resource

  property :id, Serial
  property :cheep, String
  property :time, Time

  belongs_to :user

end
