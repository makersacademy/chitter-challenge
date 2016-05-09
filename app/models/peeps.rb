require 'data_mapper'
require 'dm-postgres-adapter'


class Peep
  include DataMapper::Resource

  property :id, Serial
  property :peep, Text, required: true
  property :created_at, DateTime, required: true 

  belongs_to :user, required: true

end