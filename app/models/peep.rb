require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  property :id, Serial
  propery :content, Text
  property :created_at, DateTime

  def self.all_in_reverse_order
    self.all(order: :created_at.desc)
  end
end
