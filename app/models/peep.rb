require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, String, length: 144
  property :created_at, DateTime

  belongs_to :user

  validates_presence_of :user, message: "only users can peep"

end
