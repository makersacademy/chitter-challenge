require 'date'
module Printer

  def formatted_time
    timestamp.strftime("%m/%d/%Y %H:%M")
  end
end
