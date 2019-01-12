require './lib/message'

describe 'Message' do
  describe '#all' do
    it 'return all messages' do
      message = Message.all
      expect(message).to include 'default test message'
      expect(message).to include '2nd test message'
    end
  end
end
