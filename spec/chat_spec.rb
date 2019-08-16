require 'chat'

describe Chat do
  describe '.all' do
    it 'returns all messages' do
      Chat.create(text: 'nice to meet you', created_at: '2019-08-15 20:32:39')
      message = Chat.all.first

      expect(message.text).to eq 'nice to meet you'
      expect(message.created_at).to eq '2019-08-15 20:32:39+01'
    end
  end
  describe '.create' do
    it 'creates a new message' do
      message = Chat.create(text: 'nice to meet you', created_at: '2019-08-15 20:32:39 +0100')
      message = Chat.all.first
      expect(message.text).to eq 'nice to meet you'
    end
  end
end

