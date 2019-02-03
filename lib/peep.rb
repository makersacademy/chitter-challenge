require 'data_mapper'
require_relative 'maker'

class Peep
  include DataMapper::Resource

  belongs_to :maker

  property :id,          Serial, :key => true
  property :peeptext,    Text
  property :timestamp,   DateTime
end
