require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

  property :id,           Serial
  property :peep_content, Text
  property :time_peeped,  DateTime

  belongs_to :user

end
