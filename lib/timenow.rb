class TimeNow
  def self.is
    time = Time.new
    time.strftime("%l:%M %p, on %B %e")
  end
end
