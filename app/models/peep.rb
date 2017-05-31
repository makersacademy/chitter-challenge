class Peep
  include DataMapper::Resource

  belongs_to :user

  property :id, Serial
  property :peep, Text
  property :date, String
  property :time, String
end
