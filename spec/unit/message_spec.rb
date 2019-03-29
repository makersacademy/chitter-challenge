require 'message'

describe Message do
  describe '.all' do
    it 'returns all the messages' do
      messages = Message.all

      expect(messages).to include("Hi, my name is Riya")
    end
  end
end
