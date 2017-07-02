class Peep
  include DataMapper::Resource

  # t = Time.now
  # p t.strftime("%b %d %Y %I:%M %p")

  has n, :tags, through: Resource

  property :id, Serial
  property :message, String
  property :created_at, Time
end
