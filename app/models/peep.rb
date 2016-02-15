class Peep
  include DataMapper::Resource

  belongs_to :user
  has n, :responses

  property :id, Serial
  property :content, Text
  property :time, DateTime


  def display_time_format
    self.time.strftime("%H:%M, %d %b %y")
  end
end
