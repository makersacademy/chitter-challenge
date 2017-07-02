class Peep
  include DataMapper::Resource

  has n, :tags, through: Resource

  property :id, Serial
  property :message, String
  property :created_at, Time

  def time_stamp
    t = Time.now
    t.strftime("%b %d %Y %I:%M %p")
  end
end
