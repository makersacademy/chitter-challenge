class Peep
  include DataMapper::Resource

  belongs_to :user, required: true
  property :id,         Serial
  property :name,       String
  property :message,    String
  property :created_at, DateTime

  def username
    user.username
  end
end
