
class Peep
  include DataMapper::Resource

  property(:id, Serial)
  property(:body, String)
  property(:created_at, DateTime)

  def time_stamp
    self.created_at.strftime("on %F at %H:%M")
  end

end
