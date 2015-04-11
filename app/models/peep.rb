class Peep

  include DataMapper::Resource

  property :id, Serial
  property :date_time, Time
  property :text, Text

  belongs_to :user

end