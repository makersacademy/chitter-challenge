require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, String
  #property :user_id, Integer
  property :created_at, DateTime

  belongs_to :user

end
