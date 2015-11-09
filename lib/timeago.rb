class TimeAgo
DENOMINATIONS = {day: 86400,
                 hour: 3600,
                 minute: 60,
                 second: 1}

  def self.run(time)
    TimeAgo.new.run(time)
  end

  def run(time)
    time_ago = largest_denomination(time)
    "#{time_ago.last} #{time_ago.first}#{time_ago.last > 1 ? 's' : ''}"
  end

  def difference_in_seconds(time)
    (Time.new - time).floor
  end

  def time_by_denomination(time)
    times = {}
    DENOMINATIONS.each_pair{|unit, seconds| times[unit] =difference_in_seconds(time) / seconds}
    p times
  end

  def largest_denomination(time)
    time_by_denomination(time).select{|denomination, amount| amount > 0}.first
  end

end