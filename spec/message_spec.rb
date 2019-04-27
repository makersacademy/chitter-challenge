require 'message'

describe Message do
  describe '.all' do
    it 'returns all messages' do
      expect(Message.all).to eq ["Hello", "How are you"]
    end
  end

  describe '.post' do
    it 'add message to messages' do
      Message.post(text: "What's the plan?")

      expect(Message.all).to eq ["Hello", "How are you", "What's the plan?"]
    end
  end

end
