describe Chat do
  before(:each) { @connection = PG.connect dbname: 'chitter_test' }

  describe '.all' do
    it 'returns all chats stored in the database' do
      Chat.add('Test 1')
      Chat.add('Test 2')
      Chat.add('Most Recent Test')

      chats = Chat.all
      expect(chats.length).to eq 3

      chat = Chat.all.first
      expect(chat).to be_a Chat
      expect(chat).to respond_to(:id)
      expect(chat).to respond_to(:time)
      expect(chat.text).to eq 'Most Recent Test'
    end
  end

  describe '.add' do
    it 'adds a chat to the database' do
      chat = Chat.add('Test 1')
      expect(chat).to be_a Chat
      expect(chat).to respond_to(:id)
      expect(chat.text).to eq 'Test 1'
    end
  end
end
