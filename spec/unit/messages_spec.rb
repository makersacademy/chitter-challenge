require 'messages'

describe Messages do
  describe '.all' do
    it 'returns all messages' do
      connection = PG.connect(dbname: 'Chitter_test')

      connection.exec("INSERT INTO messages (messages) VALUES ('Welcome to Chitter');")
      messages = Messages.all

      expect(messages).to include('Welcome to Chitter')
    end
  end

  describe '.create' do
    it 'A user can create new messages' do
      Messages.create(messages: 'My new message')

      expect(Messages.all).to include 'My new message'
    end
  end
end
