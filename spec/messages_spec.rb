require 'messages'

describe Message do

  before do
    Message.create(user_id: 1, content: 'This a test')
    Message.create(user_id: 1, content: 'This is a second test')  
  end

  messages = Message.all

  it 'returns a list of messages' do
    expect(messages.first).to be_a Message
    expect(messages.length).to eq(2)
    expect(messages.first.user_id).to eq(1)
    expect(messages.first.id).to eq(1)
    expect(messages.last.id).to eq(2)
    expect(messages.first.time).to include(2020)
    expect(messages.first.content).to eq('This is a test')
    expect(messages.last.content). to eq('This is a second test')
  end
end
