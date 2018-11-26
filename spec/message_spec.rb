require 'message'
require 'database_helpers'

describe Message do

  describe '.all' do
    it 'Sees messages in a reverse chronological order' do
      Message.add(title: 'First Post', body: 'Hello World')
      Message.add(title: 'Second Post', body: 'Hello London')
      messages = Message.all

      expect(messages.first.title).to eq 'Second Post'
      expect(messages.first.body).to eq 'Hello London'
    end
  end

  describe '.add' do
    it 'Adds a new message' do
      message = Message.add(title: 'First Post', body: 'Hello World')
      persisted_data = persisted_data(table: :messages, id: message.id)

      expect(message).to be_a Message
      expect(message.id).to eq persisted_data.first['id']
      expect(message.title).to eq 'First Post'
      expect(message.body).to eq 'Hello World'
    end
  end

end
