class Peep
  include DataMapper::Resource

  belongs_to :user

  property :id, Serial
  property :peep, Text,   :lazy => false
  property :date, String
  property :time, String
end
