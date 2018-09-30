require './lib/message'

describe Message do
  it "creates a new message" do
    message = Message.create(text: 'This is a message')
    expect(message).to be_a Message
    expect(message.text).to eq 'This is a message'
  end
end
