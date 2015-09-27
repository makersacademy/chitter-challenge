class Reply
  include DataMapper::Resource

  property :id, Serial
  property :message, String
  property :user_id, Integer
  property :peep_id, Integer
  property :created_at, DateTime
  belongs_to :user
  belongs_to :peeps

end
