class Peep
  include DataMapper::Resource

  property :id, Serial
  property :peep_body, Text, required: true
  # property :peep_time, Time, required: true

  validates_presence_of :peep_body

  belongs_to :user
end
