class Peep

  include DataMapper::Resource

  property :id,     Serial
  property :message,  String
  property :username, String
  property :name, String
  property :created_at, DateTime

  validates_presence_of :message

  belongs_to :user
  has n, :comments

end
