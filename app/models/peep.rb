class Peep
  include DataMapper::Resource

  has n, :user, through: Resource

  property :id,        Serial
  property :peep,      String
  property :time,      String
  property :author,    String
  property :handle,    String

end
