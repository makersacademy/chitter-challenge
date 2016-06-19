class Reply
  include DataMapper::Resource

  property :id, Serial
  property :message, String
  property :email, String
  property :created_at, DateTime

  belongs_to :message

end
