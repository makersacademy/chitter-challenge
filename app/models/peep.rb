class Peep
  include DataMapper::Resource

  property :id,         Serial
  property :peep,       Text
  property :time_stamp, Time

  belongs_to :user
end
