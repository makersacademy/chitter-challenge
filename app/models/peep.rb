require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  property :id, Serial
  property :content, Text, length: 0..250
  property :created_at, DateTime
  belongs_to :user
  has n, :replies, 'Peep', child_key: :source_id
  belongs_to :source, 'Peep', required: false
end