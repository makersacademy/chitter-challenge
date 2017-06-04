
class Peep

  include DataMapper::Resource
  belongs_to :user, required: false

  property :id, Serial
  property :message, Text, required: true
  property :created_at, DateTime

end
