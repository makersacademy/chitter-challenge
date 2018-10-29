require './lib/message.rb'

describe Message do
  describe '#all' do
    it 'returns all messages' do
      Message.create(message: "This is my first post to chitter", time: Time.now)
      Message.create(message: "This is my second post to chitter", time: Time.now)
      message = Message.create(message: "This is my third post to chitter", time: Time.now)

      messages = Message.all

      expect(messages.length).to eq 3
      expect(messages.first).to be_a Message
      expect(messages.first.id).to eq message.id
      expect(messages.first.message).to eq 'This is my third post to chitter'
    end
  end

  describe '#create' do
    it 'Adds a bookmark to our database' do
      message = Message.create(message: "This is my first post to chitter", time: Time.now)
      persisted_data = PG.connect(dbname: 'chitter_test').exec("SELECT * FROM messages WHERE id = #{message.id};")

      expect(message).to be_a Message
      expect(message.id).to eq persisted_data.first['id']
      expect(message.time).to eq Time.now.strftime("%H:%M:%S")
      expect(message.message).to eq "This is my first post to chitter"
    end
  end
end
