require 'time_diff'

class TimeConverter
  def self.time_since(time)
    diff = Time.now - time
    diff_hash = Time.diff(time, Time.new, '%y, %M, %w, %d')
    case
    when diff < 60
      "Seconds ago"
    when diff < 159
      "About a minute ago"
    when diff < 10000
      "#{diff_hash[:minute]} minutes ago"
    when diff < 86400
      "#{diff_hash[:hour]} hours ago"
    when diff < 172800
      "Yesterday"
    else
      diff_hash[:diff] + " ago"
    end
  end
end
