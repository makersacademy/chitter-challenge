require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
require 'dm-validations'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :created_at, DateTime
  property :message, Text

  belongs_to :user

end
