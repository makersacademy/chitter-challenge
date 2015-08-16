require 'dm-timestamps'
require 'data_mapper'

class Peep

  include DataMapper::Resource

  property :id,        Serial
  property :text,      String, required: true
  property :timestamp, DateTime, required: true

  belongs_to :user

end
