def time_since(time) # time object
  year_start = Time.new(Time.now.year)
  return time.strftime('%-d %b %Y') unless time.between?(year_start, Time.now)

  one_day_ago = Time.now - 86400
  return time.strftime('%-d %b') if time.between?(year_start, one_day_ago)

  seconds = (Time.now - time).to_i # for rounding down
  
  return "#{seconds/3600}h" if seconds > 3600
  return "#{seconds/60}m" if seconds > 60
  return "#{seconds}s"
end
