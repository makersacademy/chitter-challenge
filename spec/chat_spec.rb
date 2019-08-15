require 'chat'

describe Chat do
  describe '.all' do
    it 'returns all messages' do
      messages = Chat.all
      expect(messages).to include("Hello")
      expect(messages).to include("How are you?")
      expect(messages).to include("Ruby is fantastic!")
    end
  end
end

