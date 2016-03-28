require 'bcrypt'
require 'dm-validations'

class Peep
  include DataMapper::Resource

  property :id,       Serial
  property :message,  Text,   required: true
  property :time,     DateTime

  belongs_to :user

end
