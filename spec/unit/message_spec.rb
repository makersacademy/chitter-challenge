require 'message'

describe Message do
  describe '.create' do
    it 'creates a new message with text and time' do
      message = Message.create(text: 'Hello World!', time: Time.now.localtime)
      expect(message.text).to eq 'Hello World!'
      expect(message.text).to eq "#{expect(message.text).to eq 'Hello World!'}"
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