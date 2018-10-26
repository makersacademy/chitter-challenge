require 'message'

describe Message do
  it ' returns all messages' do
    messages = Message.all

    expect(messages).to include("This is my first peep")
    expect(messages).to include("This is my second peep")
  end
end
