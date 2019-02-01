require 'data_mapper'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'postgres://david@localhost/chitter')

class Peep
  include DataMapper::Resource

  belongs_to :maker

  property :id,          Serial, :key => true
  property :peeptext,    Text
  property :timestamp,   DateTime
end
