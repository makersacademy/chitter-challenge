class DateTimeFormat

  def self.datetime_format(post_time)
    return time_format(post_time) if time_format(post_time) == 'just now'
    return date_format(post_time) + time_format(post_time)
  end

  def self.today?(post_time)
    now = Time.now
    return true if (post_time.day == now.day &&
            post_time.month == now.month &&
            post_time.year == now.year)
  end

  def self.date_format(post_time)
    return 'today' if today?(post_time)
    post_formatted = post_time.strftime("%d %B %Y")
  end

  def self.time_format(post_time)
    now = Time.now
    return 'just now' if post_time < now + 120
    return " at #{post_time.strftime('%H:%m')}"
  end

end

times = [Time.now, Time.now + 60, Time.now + 60 * 60 * 24]

p times.map { |time| DateTimeFormat.today?(time) }
p times.map { |time|  DateTimeFormat.date_format(time) }
p times.map { |time| DateTimeFormat.time_format(time) }
p times.map { |time| DateTimeFormat.datetime_format(time) }
