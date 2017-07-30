require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, String
  property :created_at, DateTime
  property :time, String
  property :user_id, Integer
  
  belongs_to :user, required: true
end
