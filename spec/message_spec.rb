require 'message'

describe Message do

  it 'User can post a message to chitter' do
    message = Message.add(title: 'Hello World', body: 'First post')
    messages = Message.all

    expect(messages.length).to eq 1
    expect(messages.first).to be_a Message
    expect(messages.first.id).to eq message.id
    expect(messages.first.title).to eq 'Hello World'
    expect(messages.first.body).to eq 'First post'
  end

end