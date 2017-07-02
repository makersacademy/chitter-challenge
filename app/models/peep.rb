class Peep

  include DataMapper::Resource

  property :id, Serial
  property :body, Text
  property :created_at, DateTime


  def time_stamp
    "#{created_at.strftime("%I:%M %p %b %d, 20%y")}"
  end
end
