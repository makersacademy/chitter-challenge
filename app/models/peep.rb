require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  belongs_to :user

  property :id,           Serial
  property :peep_content, String
  property :created_at,   DateTime
end
