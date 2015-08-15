class Peep
  include DataMapper::Resource

  property :id, Serial
  property :user, String
  property :peeps, String

end