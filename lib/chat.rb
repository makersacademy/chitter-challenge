require './app/data_mapper_setup.rb'

class Chat

  def msgs
    order_msgs(find_msgs)
  end

  def order_msgs(msgs_arr)
    msgs_arr.sort_by { |msg| msg.time }
  end

  def find_msgs(message_class = Message)
    message_class.all
  end
end
