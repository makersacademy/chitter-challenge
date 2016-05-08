require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  belongs_to :user

  property :id,         Serial
  property :message,    Text, length: 1..240, required: true
  property :created_at,  DateTime

end
