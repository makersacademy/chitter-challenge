require 'dm-validations'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :message, Text
  property :created_at, DateTime

  has 1, :user, :through => Resource
end
