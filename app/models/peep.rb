
class Peep

  include DataMapper::Resource

  property :id, Serial
  property :text, Text, required: true
  property :created_at, DateTime

  has 1, :user, through: Resource

  validates_presence_of :text

end
