require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, String
  property :created_at, DateTime
  property :user_id, Integer

  belongs_to :user, required: true

  validates_presence_of :message
end
