
class Peep
  include DataMapper::Resource

  property(:id, Serial)
  property(:body, String)
  property(:time, Integer)

end
