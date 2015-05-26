require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, String
  property :created_at, Time

  belongs_to :user
end