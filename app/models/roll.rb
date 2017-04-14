class Roll

  include DataMapper::Resource

  belongs_to :user

  property :text, String, length: 255
  property :id, Serial
  property :poster_id, Integer
  property :time, EpochTime

end
