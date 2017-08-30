class Peep

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :message, String
  property :created_at, DateTime

  def time
    c = created_at
    "#{c.hour}:#{c.minute} #{c.day}-#{c.month}-#{c.year}"
  end
end
