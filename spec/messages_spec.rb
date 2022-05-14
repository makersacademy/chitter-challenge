require 'message'
require 'pg'

describe Message do
  describe '.all' do
    it 'displays all the messages' do
      message_1 = Message.post('Message one, blah blah')
      message_2 = Message.post('Message two, blah blah blah')

      expect(Message.all.first.content).to include message_1.content
      #expect(Message.all).to include message_2
    end
  end

  describe '.post' do
    it 'posts a message' do
      content = 'This is a very important message'
      message = Message.post(content)
      expect(Message.all.first.content).to eq(message.content)
    end
  end

  describe '#timestamp' do
    it 'displays when the message was posted' do
      message = Message.post('This is a very important message')
      p message.timestamp[0]['timestamp']
      expect(message.timestamp).to eq "2022-05-14 20:39:56.262763" 
    end
  end
end