require 'data_mapper'
require 'dm-postgres-adapter'
#require 'dm-validations'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, Text

  #validates_length_of :content, max: 140

  belongs_to :user
end
