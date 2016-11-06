class Peep

  include DataMapper::Resource

  belongs_to :user

  property :id,      Serial
  property :peep,    Text, length: 255
  property :time,    Time

end
