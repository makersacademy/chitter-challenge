
class Peep

  include DataMapper::Resource
  #belongs_to :user

  property :id, Serial
  property :message, Text, required: true
  property :created_at, DateTime
  property :user_id, Integer

end
