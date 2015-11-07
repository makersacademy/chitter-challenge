class Peep
  include DataMapper::Resource

  property :id,         Serial
  property :content,    String,
           length:      250,
           required:    true
  property :created_at, DateTime

  has 1, :user, through: Resource

end
