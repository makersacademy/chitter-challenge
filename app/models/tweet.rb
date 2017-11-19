class Tweet

  include DataMapper::Resource

  property :id, Serial
  property :text, Text #, :required => true
  property :time, DateTime
  property :username, String

  has 1, :user, :through => Resource

end
