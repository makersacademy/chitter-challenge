require 'message'
require 'pg'

describe Message do
  describe '.all' do
    it 'displays all the messages' do
      Message.post('Message one, blah blah')
      Message.post('Message two, blah blah blah')

      persisted_data = PG.connect(dbname: 'messages_test').query("SELECT * FROM messages;")
      messages = Message.all

      expect(messages.length).to eq 2
      expect(messages.first).to be_a Message
      expect(messages.first.id).to eq persisted_data.first['id']
      expect(messages.first.content).to eq 'Message one, blah blah'
      expect(messages.first.timestamp).to eq persisted_data.first['timestamp']
    end
  end

  describe '.post' do
    it 'posts a message' do
      content = 'This is a very important message'
      message = Message.post(content)
      persisted_data = PG.connect(dbname: 'messages_test').query("SELECT * FROM messages WHERE id = #{message.id};")
 
      expect(message).to be_a Message
      expect(message.id).to eq persisted_data.first['id']
      expect(message.content).to eq content
      expect(message.timestamp).to eq persisted_data.first['timestamp']
    end
  end

  describe '#timestamp' do
    it 'displays when the message was posted' do
      message = Message.post('This is a very important message')
      persisted_data = PG.connect(dbname: 'messages_test').query("SELECT * FROM messages WHERE id=#{message.id};")

      expect(message.timestamp).to eq persisted_data.first['timestamp']
    end
  end
end