require_relative 'datamapper'

class Peep
  include DataMapper::Resource

  attr_reader :peep

  property :id,         Serial
  property :peep,       String
  property :user_id,    Serial
end

DataMapper.auto_migrate!
DataMapper.finalize
