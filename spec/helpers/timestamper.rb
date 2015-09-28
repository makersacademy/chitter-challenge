require 'time_difference'

module Timestamper

  def relative_time(creation_time)
    fail 'Must enter a time' unless creation_time.is_a? Time
    diff = TimeDifference.between(creation_time, Time.now).in_general
    if diff[:weeks] > 0 || diff[:months] > 0 || diff[:years] > 0
      return "Over a week ago"
    elsif diff[:days] == 1
      return "1 day ago"
    elsif diff[:days] > 0
      return "#{diff[:days]} days ago"
    elsif diff[:hours] == 1
      return "1 hour ago"
    elsif diff[:hours] > 0
      return "#{diff[:hours]} hours ago"
    elsif diff[:minutes] == 1
      return "1 minute ago"
    elsif diff[:minutes] > 0
      return "#{diff[:minutes]} minutes ago"
    elsif diff[:seconds] == 1
      return "1 second ago"
    elsif diff[:seconds] > 0
      return "#{diff[:seconds]} seconds ago" 
    else
      return "Just now"
    end
  end

end