require './app/data_mapper_setup.rb'

module Chat

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

  def create_msg(msg, user)
    Message.create(content: msg, time: Time.now, user_id: user.id)
  end

end
