describe Chat do
  before(:each) { @connection = PG.connect dbname: 'chatter_test' }

  describe '.all' do
    it 'returns all chats stored in the database' do
      @connection.exec("INSERT INTO chats (text) VALUES('Test 1');")
      @connection.exec("INSERT INTO chats (text) VALUES('Test 2');")
      @connection.exec("INSERT INTO chats (text) VALUES('Test 3');")

      chats = Chat.all
      chat = Chat.all.first
      expect(chats.length).to eq 3
      expect(chat).to be_a Chat
      expect(chat).to respond_to(:id)
      expect(chat.text).to eq 'Test 1'
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
