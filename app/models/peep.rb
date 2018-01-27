require 'data_mapper'
require 'dm-postgres-adapter'
# understands how to create a Peep table
class Peep
  include DataMapper::Resource

  property :id, Serial
  property :peep_text, Text
  property :created_at, DateTime
end
