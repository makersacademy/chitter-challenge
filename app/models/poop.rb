require 'data_mapper'
require 'dm-postgres-adapter'

class Poop

  include DataMapper::Resource

  property :id,   Serial
  property :content, Text

  belongs_to :user


end
