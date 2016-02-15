class Reply

  include DataMapper::Resource

  has n, :peeps, through: Resource

  property :id, Serial
  property :reply, Text
  property :time, String
  property :user_id, Integer

end
