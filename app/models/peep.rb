require 'dm-timestamps'

class Peep
  include DataMapper::Resource
  belongs_to :user, :key => true

    property :id, Serial
    property :peep_message, String, length: 140
    property :created_at, DateTime
    property :created_on, Date
    property :author, String, required: true,
      message: 'This is a members only cult. IMPOSTER'


  validates_length_of :peep_message, within: 1..140

end

# DataMapper.finalize
# DataMapper.auto_upgrade!
