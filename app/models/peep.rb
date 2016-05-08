class Peep
  include DataMapper::Resource
  has n, :user, through: Resource

  property :id, Serial
  property :handle, String, :required => true
  property :text, String, :required => true
  property :time, Serial, :required => true

end