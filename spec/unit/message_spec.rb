require 'message'

describe Message do
  describe '.create' do
    it 'creates a new message' do
      message = Message.create(text: 'Hello World!')
      p message
      expect(message.text).to eq 'Hello World!'
    end
  end
  
  describe '.all' do
    it 'returns an array of messages' do
      Message.create(text: 'Hello World!')
      messages = Message.all
      expect(messages.first.text).to eq 'Hello World!'
    end
  end
end