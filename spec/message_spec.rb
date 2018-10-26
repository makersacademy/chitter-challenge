require 'message'

describe Message do

  describe '#all' do
    it 'returns all messages' do
      messages = Message.all

      expect(messages).to include("This is a test message")
      expect(messages).to include("This is a second test message")
    end
  end

end
