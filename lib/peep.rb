class Peep
  include DataMapper::Resource

  property :id, Serial, :key => true
  property :peep, String
  property :peep_time, Time

  belongs_to :user
end
