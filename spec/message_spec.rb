require 'message'

describe Message do

  describe '#all' do
    it 'returns all messages' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO messages (content) VALUES ('This is a test message');")
      connection.exec("INSERT INTO messages (content) VALUES('This is a second test message');")

      messages = Message.all

      expect(messages).to include("This is a test message")
      expect(messages).to include("This is a second test message")
    end
  end

end
