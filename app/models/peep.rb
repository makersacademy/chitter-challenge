require 'data_mapper'
require 'dm-validations'

class Peep
  include DataMapper::Resource
  property :id, Serial
  property :content, Text, :length => 1..139
  property :created_at, DateTime

  belongs_to :user
end
