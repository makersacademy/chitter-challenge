require 'data_mapper'
require 'dm-postgres-adapter'

class Peep

  include DataMapper::Resource

  belongs_to :user

  property :id, Serial
  property :text, String
  property :time, String

  def self.reverse_chronological_order
    self.all(order: :time.desc)
  end

end