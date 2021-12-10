require 'message'

describe Message do
  describe '.all' do
    it 'returns an array of messages' do
      messages = Message.all
      
      expect(messages.first.text).to eq 'Hello World!'
    end
  end
end