class Peep
  include DataMapper::Resource

  property :id, Serial
  property :body, Text
  property :time, DateTime
  belongs_to :user
  has n, :replies  

  def formatted_time
    self.time.strftime("%F, at %H:%M")
  end
end
