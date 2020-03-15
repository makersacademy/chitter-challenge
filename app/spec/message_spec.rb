require 'message'
require 'helpers'

describe Message do
  it 'should exist as a message object' do
    expect(Message.create).to be_a Message
  end

  it 'should have content' do
    message = Message.create(content: "this is a test peep", time_created: Time.now)
    expect(message.content).to eq "this is a test peep"
  end
end
