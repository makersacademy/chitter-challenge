require 'time'

class Time_Calculation

  def self.calculation
    a = [] << Time.now
    s = a.join("").gsub!(/\+0000/,"")
    t = s.slice(10, 19).slice(1,8)
  end


end
