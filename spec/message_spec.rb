require 'message'
require 'pg'
require 'date'

describe Message do
  describe '.all' do
    it 'returns all messages in reverse chronological order' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO messages (content, date_posted) VALUES('Before message', NOW())")
      connection.exec("INSERT INTO messages (content, date_posted) VALUES('After message', NOW())")

      expect(Message.all.first.content).to eq('After message')
    end
  end

  describe '.post' do
    it 'adds a message to Message' do
      Message.post('This is a message')
      connection = PG.connect(dbname: 'chitter_test')
      result = connection.exec("SELECT * FROM messages")
      
      expect(result.first["content"]).to eq('This is a message')
    end
  end
end