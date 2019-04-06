require 'data_mapper'
require_relative './user'

class Peep
  include DataMapper::Resource

  property :id,         Serial
  property :content,    Text, :lazy => false
  property :created_at, DateTime

  belongs_to :user

  def self.allPeepsInReverseOrder
    all order: [:id.desc]
  end
end
