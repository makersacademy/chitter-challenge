require 'dm-timestamps'

class Poop
  include DataMapper::Resource
  

  property :id, Serial
  property :poop_msg, Text
  property :created_at, DateTime

  belongs_to :user
end
