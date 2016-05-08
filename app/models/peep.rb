require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, String, length: 144,
            message: 'your peep is too long'
  property :created_at, DateTime
  property :in_response_to, Integer, required: false

  belongs_to :user

  validates_presence_of :user, message: "only users can peep"

end
