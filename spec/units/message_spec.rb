require 'message'

describe Message do
  describe '.all' do
    it 'returns all messages' do
      messages = Message.all

      expect(messages).to include("Arrr, my spleen!")
      expect(messages).to include("Me pantaloons are on me head.")
      expect(messages).to include("Her locker is like davey jones locker!")
    end
  end
end
