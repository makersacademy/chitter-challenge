require 'data_mapper'
require 'dm-postgres-adapter'

class Bottle
  include DataMapper::Resource

  property :id, Serial
  property :message, Text
  property :time, DateTime

  def self.reverse_chronological_order
    all(order: :time.desc)
  end
end
