class Peep
  include DataMapper::Resource

  has n, :tags, through: Resource

  property :id, Serial
  property :message, String
  property :created_at, Time

  def time_stamp
    "#{created_at.strftime("%b %d %Y %I:%M %p")}"
  end
end
