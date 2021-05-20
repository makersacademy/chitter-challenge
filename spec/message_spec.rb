require 'message'

describe Message do
  describe '.all' do
    it 'returns all messages' do
      expect(Message.all).to include('Test message')
    end
  end
end