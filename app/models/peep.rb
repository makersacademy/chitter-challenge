class Peep

  include DataMapper::Resource
  property :id, Serial
  property :time_now, String
  property :message, Text

  belongs_to :user

end
