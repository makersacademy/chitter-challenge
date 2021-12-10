require 'message'

describe Message do
  describe '.create' do
    it 'creates a new message with text and time' do
      message = Message.create(text: 'Hello World!')
      expect(message.text).to eq 'Hello World!'
      expect(message.created_at).to eq "#{Time.new.strftime("%H:%M %p %b' %d, %y")}"
    end

    it 'stores message author if logged in' do
      message = Message.create(text: 'Hello World!', author: 'Sherwin')
      expect(message.text).to eq 'Sherwin'
    end

    it 'stores message author as guest if logged out' do
      message = Message.create(text: 'Hello World!')
      expect(message.text).to eq 'Guest'
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