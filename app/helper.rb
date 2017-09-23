def peep_length_of_time(from_time, to_time = Time.now, options = {})
  from_time = from_time.to_time if from_time.respond_to?(:to_time)
  to_time   = to_time.to_time   if to_time.respond_to?(:to_time)

  length_in_minutes = (((to_time - from_time).abs)/60).round
  length_in_seconds = ((to_time - from_time).abs).round

  case length_in_minutes
    when 0..1
      case length_in_seconds
      when 0..59 then "#{length_in_seconds}s"
      else          '1m'
      end
    when 2..59    then "#{length_in_minutes}m"
    when 60..1439 then "#{(length_in_minutes.to_f / 60.0).round}h"
    else
      year = " %y" if from_time.year != Time.now.year
      from_time.strftime("#{from_time.day} %b#{year}")
  end
end
