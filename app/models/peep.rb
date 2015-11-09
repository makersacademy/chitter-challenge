require 'dm-validations'

class Peep
  include DataMapper::Resource

  property :id,           Serial
  property :message,      Text, required: true, length: 140
  property :timestamp,    DateTime

  belongs_to :user

end
