require_relative 'datamapper'

class Peep
  include DataMapper::Resource

  property :id,           Serial
  property :peep,         String
  property :created_at,   DateTime
  property :user_id,      Serial
end

DataMapper.finalize
