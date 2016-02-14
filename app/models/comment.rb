require 'dm-timestamps'

class Comment
  include DataMapper::Resource

  property :id, Serial
  property :comment_message, String, length: 50
  property :created_at, DateTime
  property :created_on, Date
  property :author, String, required: true,
    message: 'This is a members only cult. IMPOSTER'

  # validates_length_of :peep_message, within: 1..50

  # belongs_to :peep, key: true
end
