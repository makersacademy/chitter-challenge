require 'messages'

describe Messages do
  describe '#create' do
    it 'create a new message' do
      message = Messages.create('1', 'Hello', '2', '3', 'Rob')
      expect(message).to be_a Messages
      expect(message.text).to eq 'Hello'
    end
  end
end
