require 'message'
require 'database_helpers'

describe Message do

  describe '.all' do
    it 'User can post a message to chitter' do
      message = Message.add(title: 'First Post', body: 'Hello World')
      messages = Message.all

      expect(messages.length).to eq 1
      expect(messages.first).to be_a Message
      expect(messages.first.id).to eq message.id
      expect(messages.first.title).to eq 'First Post'
      expect(messages.first.body).to eq 'Hello World'
    end
  end

  describe '.add' do
    it 'Adds a new message' do
      message = Message.add(title: 'First Post', body: 'Hello World')
      persisted_data = persisted_data(id: message.id)

      expect(message).to be_a Message
      expect(message.id).to eq persisted_data.first['id']
      expect(message.title).to eq 'First Post'
      expect(message.body).to eq 'Hello World'
    end
  end

end