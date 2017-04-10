require 'dm-timestamps'
require 'dm-core'
require 'dm-validations'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :peep, Text
  property :created_at, DateTime

  has n, :hashtags, through: Resource
  
  def self.reverse_order
    self.all(order: :created_at.desc)
  end

end
