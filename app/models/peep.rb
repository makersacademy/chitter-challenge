class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, String
  property :time, Time

  belongs_to :user

end
