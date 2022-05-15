require 'chitter'

describe Chitter do
  describe '.all' do
    it 'returns all messages' do
      connection = PG.connect(dbname: 'chitter_messenger_test')

      connection.exec("INSERT INTO messages (peep) VALUES ('I love Chitter!');")
      connection.exec("INSERT INTO messages (peep) VALUES ('How do I peep?');")
      connection.exec("INSERT INTO messages (peep) VALUES ('This is so fun.');")

      messages = Chitter.all

      expect(messages).to include("I love Chitter!")
      expect(messages).to include("How do I peep?")
      expect(messages).to include("This is so fun.")
    end
  end
end
