class Peep

  include DataMapper::Resource

  belongs_to :user

  property :id, Serial
  property :text, String
  property :time, Time

end