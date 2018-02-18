require_relative 'datamapper'

class Peep
  include DataMapper::Resource

  belongs_to :user

  property :id,           Serial
  property :peep,         String
  property :created_at,   DateTime
  property :user_id,      Serial
end
