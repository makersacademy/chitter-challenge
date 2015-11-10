class TimeAgo

  def self.run(time)
    TimeAgo.new.run(time)
  end

  def run(time)
    time_ago = largest_denomination(time)
    "#{time_ago.last} #{time_ago.first}#{time_ago.last > 1 ? 's' : ''}"
  end

  private
  DENOMINATIONS = {day: 86_400,
                   hour: 3600,
                   minute: 60,
                   second: 1}

  def largest_denomination(time)
    time_by_denomination(time).select{|denomination, amount| amount > 0}.first
  end

  def time_by_denomination(time)
    DENOMINATIONS.map{|unit, seconds| [unit, difference_in_seconds(time) / seconds]}.to_h
  end

  def difference_in_seconds(time)
    (Time.new - time).floor
  end


end