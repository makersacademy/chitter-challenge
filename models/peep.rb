require 'dm-timestamps'
class Peep
  include DataMapper::Resource
  property :id, Serial
  property :message, Text
  # belongs_to, :user
  property :created_at, DateTime
end
