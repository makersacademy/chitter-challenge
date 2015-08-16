class Peep
  include DataMapper::Resource

  property :id, Serial
  property :user, String
  property :peeps, String
  property :time, DateTime

end