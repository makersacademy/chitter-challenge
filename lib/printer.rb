require 'date'
module Printer

  def formatted_time
    self.timestamp.strftime("%m/%d/%Y %H:%M")
  end
end
