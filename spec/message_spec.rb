require_relative '../lib/message'
require_relative './choose_database_table'

describe Message do

  context '#all' do
    it 'returns an array of all messages' do
      message = Message.create(message: 'Hello Chitter')
      Message.create(message: 'Hello World')
      Message.create(message: 'Hello Twitter')

      messages = Message.all

      expect(messages.length).to eq 3
      expect(messages.first).to be_a Message
      expect(messages.first.id).to eq message.id
      expect(messages.first.comment).to eq 'Hello Chitter'
    end
  end

  context '#create' do
    it 'inputs value into database and returns an object (ORM)' do
      message = Message.create(message: 'Hello Chitter')
      persisted_data = persisted_data(table: 'messages', id: message.id)
      p persisted_data.first
      expect(message).to be_a Message
      expect(message.id).to eq persisted_data.first['id']
      expect(message.comment).to eq persisted_data.first['comment']
    end
  end
end
