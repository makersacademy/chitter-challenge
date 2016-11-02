require_relative 'dm_setup'

class Twit
  include DataMapper::Resource

  belongs_to :owl

  property :id, Serial
  property :content, Text
  property :likes, Integer
  property :updated_at, DateTime
  property :created_at, DateTime
end