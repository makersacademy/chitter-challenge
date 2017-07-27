require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-core'
require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  belongs_to :user

  has n, :tags, through: Resource

  property :id, Serial
  property :content, Text
  property :created_at, DateTime

  def self.all_in_chronological_order
    self.all(order: :created_at.desc)
  end
end
