class Peep

  include DataMapper::Resource

  property :id, Serial
  property :peep, Text
  property :entry_time, Time

  belongs_to :user

end