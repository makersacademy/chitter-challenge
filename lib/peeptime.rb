require 'time'

class PeepTime

  def self.formatted_date(timestamp)
     time = Time.parse(timestamp)
     time.strftime("%d of %B, %Y")
  end

  def self.formatted_time(timestamp)
    time = Time.parse(timestamp)
    time.strftime("%k%M")
  end
end
