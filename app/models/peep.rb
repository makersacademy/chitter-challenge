require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'
#require 'dm-validations'

class Peep
  include DataMapper::Resource

  property :id, Serial, key: true
  property :content, Text
  property :created_at, DateTime

  #validates_length_of :content, max: 140

  belongs_to :user
end
