require 'message'
require 'pg'

describe Message do
  describe '.all' do
    it 'displays all the messages' do
      connection = PG.connect(dbname: 'messages_test')
      connection.exec("INSERT INTO messages (content) VALUES ('Message one, blah blah');")
      connection.exec("INSERT INTO messages (content) VALUES ('Message two, blah blah blah');")

      expect(Message.all).to include "Message one, blah blah"
      expect(Message.all).to include "Message two, blah blah blah"
    end
  end
end