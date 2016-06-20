require 'data_mapper'
require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :created_at, DateTime
  property :message, String, length: 140, required: true
  belongs_to :user

end
