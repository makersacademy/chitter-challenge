require 'messages'

describe Messages do
  describe '.all' do
    it 'returns all messages' do
      messages = Messages.all
      expect(messages).to include("Welcome to Chitter")
    end
  end
end
