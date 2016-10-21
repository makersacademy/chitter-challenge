require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

  belongs_to :user

  property :id,   Serial
  property :peep_text, String
  property :date_time, DateTime

end
