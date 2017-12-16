require './lib/chat.rb'

describe Chat do
  subject(:chat) { described_class.new }
  let(:message_class) { double(:my_message_class, all: messages) }
  let(:message1) { double(:my_message_1, time: Time.now)}
  let(:message2) { double(:my_message_2, time: (Time.now + 60))}
  let(:messages)  { [message2, message1] }

  it 'orders messages by time' do
    raw_msg_list = chat.find_msgs(message_class)
    expect(chat.order_msgs(raw_msg_list)).to eq [message1, message2]
  end

end
