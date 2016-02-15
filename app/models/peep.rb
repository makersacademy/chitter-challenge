require 'dm-timestamps'

class Peep

  include DataMapper::Resource
  belongs_to :user, :key => true

  property :id, Serial
  property :peep_text, String, length: 140

  validates_length_of :peep_text, within: 1..140

end
