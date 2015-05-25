class Peep

  include DataMapper::Resource

  belongs_to :user
  has n, :replies

  property :id, Serial
  property :text, String
  property :time, Time

end