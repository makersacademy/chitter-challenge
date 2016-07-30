class TimeString

  def self.date
    posted = Time.now.to_s
    datepoor = posted.split(' ').first
    date = datepoor.split('-').reverse.join(',')
  end

  def self.time
    posted = Time.now.to_s
    time = posted.split(' ')[1].slice(0,5)
  end

end
