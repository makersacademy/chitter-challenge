require './app/data_mapper_setup.rb'

class Chat

  def msgs
    format_msgs(order_msgs(find_msgs))
  end

  def format_msgs(msgs_arr)
    msgs_arr.map do |msg|
      msg.time_string = msg.time.strftime("%b %e, %l:%M %p")
      msg
    end
  end

  def order_msgs(msgs_arr)
    msgs_arr.sort_by { |msg| msg.time }
  end

  def find_msgs(message_class = Message)
    message_class.all
  end

  def create_msg(msg)
    Message.create(content: msg, time: Time.now)
  end

end
