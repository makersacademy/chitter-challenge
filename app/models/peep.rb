require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

  belongs_to :user

  has n, :tags, through: Resource, constraint: :destroy
  has n, :replys, through: Resource, constraint: :destroy

  property :id, Serial
  property :content, Text, required: true
  property :created_at, DateTime, required: true

  validates_presence_of :content

  def self.all_in_reverse_order
    self.all.reverse ||= []
  end
end
