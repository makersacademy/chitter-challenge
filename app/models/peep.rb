require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :created, DateTime

  belongs_to :user

end
