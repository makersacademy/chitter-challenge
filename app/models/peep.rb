require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  property :id,         Serial
  property :content,    String, length: 140, required: true
  property :created_at, DateTime
  property :updated_at, DateTime

  belongs_to :user
  has n, :replies
end
