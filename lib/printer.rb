require 'date'
module Printer
  NAME_TIME_GAP = 7
  def print_messages
    Message.all.reverse do |message|
      message_format(message)
    end
  end

  private

  def message_format(message)
    print "#{message.content}\n"
    print "#{message.user.user_name}"
    print " "*NAME_TIME_GAP
    print "#{message.timestamp.strftime("%m/%d/&Y %H:%M")}\n"
    print "\n"
    print "\n"
  end
end
