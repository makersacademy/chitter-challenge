require 'data_mapper'
require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :user_id, String, required: true
  property :created_at, DateTime
  property :message, String, length: 140, required: true

end
