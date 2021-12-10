require 'message'

describe Message do
  describe '.create' do
    it 'creates a new message with text and time' do
      message = Message.create(text: 'Hello World!')
      expect(message.text).to eq 'Hello World!'
      expect(message.created_at).to eq "#{Time.new.strftime("%H:%M %p %b' %d, %y")}"
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