require 'data_mapper'
require 'dm-postgres-adapter'

class Poop

  include DataMapper::Resource

  property :id,   Serial
  property :poop, String

  belongs_to :user


end
