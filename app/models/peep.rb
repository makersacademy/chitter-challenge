class Peep
  include DataMapper::Resource

  belongs_to :user, required: true

  property :id, Serial
  property :name, String
  property :username, String
  property :user_id, String
  property :message, String
  property :created_at, DateTime

end
