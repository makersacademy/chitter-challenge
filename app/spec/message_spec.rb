require 'message'
require 'helpers'

describe Message do
  it 'should exist as a message object' do
    expect(Message.create).to be_a Message
  end

  before(:each) do
    @message = Message.create(content: "this is a test peep", time_created: Time.now)
  end

  it 'should have content' do
    expect(@message.content).to eq "this is a test peep"
  end

  it 'should have a time stamp' do
    expect(@message).to have_attribute (:time_created)
  end
end
