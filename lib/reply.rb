class Reply

  include DataMapper::Resource
  has 1, :peep, through: DataMapper::Resource

  property :id, Serial
  property :reply, String
  property :user, String

end
