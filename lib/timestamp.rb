require 'time'
require 'date'

module Timestamp

  def self.current_time
     time = Time.now
     time.strftime("%d of %B, %Y")
  end

end
