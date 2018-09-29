require 'dm-timestamps'
require_relative './user.rb'

class Peep
  include DataMapper::Resource
  property :id, Serial
  property :message, Text, length: 1..141
  property :created_at, DateTime
  belongs_to :user
end
