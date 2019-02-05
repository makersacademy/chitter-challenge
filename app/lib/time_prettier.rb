require 'time'

class TimePrettier
  def self.formatted_date(timestamp)
    time = Time.parse(timestamp)
    time.strftime("%d %B, %Y")
  end 

  def self.formatted_time(timestamp)
    time = Time.parse(timestamp)
    time.strftime("%k%M")
  end
end