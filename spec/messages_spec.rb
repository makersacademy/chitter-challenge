require 'message'
require 'pg'

describe Message do
  describe '.all' do
    it 'displays all the messages' do
      Message.post('Message one, blah blah')
      Message.post('Message two, blah blah blah')

      expect(Message.all).to include "Message one, blah blah"
      expect(Message.all).to include "Message two, blah blah blah"
    end
  end

  describe '.post' do
    it 'posts a message' do
      content = 'This is a very important message'
      Message.post(content)
      expect(Message.all).to eq [content]
    end
  end
end