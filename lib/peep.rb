require 'data_mapper'
require_relative './user'

class Peep
  include DataMapper::Resource

  property :id,         Serial
  property :content,    Text, :lazy => false
  property :created_at, Time

  belongs_to :user

  def self.allPeepsInReverseOrder
    all order: [:created_at.desc]
  end
end
