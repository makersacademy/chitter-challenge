class Peep

  include DataMapper::Resource

  property :id,         Serial
  property :message,    String
  property :time,       Time

  belongs_to :maker

  def nice_time
    self.time.to_datetime.strftime("%l: %M %p %A %e %B")
  end



end