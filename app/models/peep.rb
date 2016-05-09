require 'bcrypt'
require 'dm-validations'
require 'dm-timestamps'

class Peep
  include BCrypt
  include DataMapper::Resource

  property :id,        Serial, required: true
  property :created_at, DateTime
  property :input,      Text, required: true


  belongs_to :user

end
