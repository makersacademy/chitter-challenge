require 'message'
require 'user'
require 'pg'
require './lib/database_connection'

def persisted_data(table:, id:)
    DatabaseConnection.query("SELECT * FROM #{table} WHERE id = $1;", [id])
end


describe Message do
  describe '.create' do
    it 'creates a new message' do
      user = User.create(username: 'username1234', password: '123457jghjhgj', password_confirmation: '123457jghjhgj')
      message = Message.create(text: 'This is a test message', user_id: user.id)

      persisted_data = persisted_data(table: 'messages', id: message.id )

      expect(message).to be_a Message
      expect(message.id).to eq persisted_data.first['id']
      expect(message.text).to eq 'This is a test message'
      expect(message.user_id).to eq user.id
    end
  end

  describe '.where' do
    it 'gets the relevant messages from the databse' do
      user = User.create(username: 'username1234', password: '123457jghjhgj', password_confirmation: '123457jghjhgj')
      Message.create(text: 'This is a test message', user_id: user.id)
      Message.create(text: 'This is a second test message', user_id: user.id)

      messages = Message.where(user_id: user.id)
      message = messages.first
      persisted_data = persisted_data(table: 'messages', id: message.id)

      expect(messages.length).to eq 2
      expect(message.id).to eq persisted_data.first['id']
      expect(message.text).to eq 'This is a second test message'
      expect(message.user_id).to eq user.id
    end
  end

  describe '.all' do
    it 'returns a list of messages' do
      user = User.create(username: 'username1234', password: '123457jghjhgj', password_confirmation: '123457jghjhgj')
      Message.create(text: 'This is a test message', user_id: user.id)
      Message.create(text: 'This is a second test message', user_id: user.id)
      messages = Message.all.reverse
      message = messages.first
      persisted_data = persisted_data(table: 'messages', id: message.id)
      expect(messages.length).to eq 2
      expect(messages.first).to be_a Message
      expect(messages.first.id).to eq persisted_data.first['id']
      expect(messages.first.text).to eq 'This is a test message'
     end
   end

   describe '.find' do
    it 'returns the requested message object' do
      user = User.create(username: 'username1234', password: '123457jghjhgj', password_confirmation: '123457jghjhgj')
      message = Message.create(text: 'This is a test message', user_id: user.id)
      result = Message.find(id: message.id)

      expect(result).to be_a Message
      expect(result.id).to eq message.id
      expect(message.text).to eq 'This is a test message'
    end
  end

  describe '.delete' do
    it 'deletes the given message' do
      user = User.create(username: 'username1234', password: '123457jghjhgj', password_confirmation: '123457jghjhgj')
      message = Message.create(text: 'This is a test message', user_id: user.id)
      Message.delete(id: message.id)
  
      expect(Message.all.length).to eq 0
    end
  end

  describe '.update' do
    it 'updates the message with the given data' do
      user = User.create(username: 'username1234', password: '123457jghjhgj', password_confirmation: '123457jghjhgj')
      message = Message.create(text: 'This is a test message', user_id: user.id)
      updated_message = Message.update(id: message.id, text: 'This is a second test message')

      expect(updated_message).to be_a Message
      expect(updated_message.id).to eq message.id
      expect(updated_message.text).to eq 'This is a second test message'
    end
  end

end 