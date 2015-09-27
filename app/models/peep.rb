class Peep
  include DataMapper::Resource

  property :id, Serial
  property :peep, Text, :length => 140
  property :time, DateTime
  belongs_to :user

end
