require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :created_at, DateTime
  property :text, Text

  belongs_to :user
end