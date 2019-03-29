require 'message'

describe Message do
  describe '.all' do
    it 'returns all the messages' do
      connection = PG.connect(dbname: 'chitter_manager_test')
      connection.exec("INSERT INTO messages (message) VALUES ('Hi, my name is Riya');")

      messages = Message.all
      expect(messages).to include("Hi, my name is Riya")
    end
  end
end
