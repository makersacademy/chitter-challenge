require 'message'

describe Message do

  describe '.all' do
    it 'shows all messages' do
      messages = Message.all

      expect(messages).to include "hello, what a beautiful day"
      expect(messages).to include "but it is raining"
    end
  end

  describe '.create' do
    it 'creates a new message' do
      message = Message.new

      expect(message).to include('Hello')
    end
  end
end
