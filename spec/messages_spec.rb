require 'messages'
require 'users'

describe Messages do
  describe '#create' do
    it 'create a new message' do
      user = Users.create('test@test.com', 'password', 'John Doe', 'J')
      message = Messages.create('Hello', user)
      expect(message).to be_a Messages
      expect(message.text).to eq 'Hello'
    end
  end

  describe '#show_all' do
    it 'shows all the messages' do
      user1 = Users.create('test@test.com', 'password', 'John Doe', 'J')
      user2 = Users.create('test2@test.com', 'password', 'John Doe 2', 'J 2')
      Messages.create('Hello', user1)
      Messages.create('Hello Chitter', user2)
      messages = Messages.show_all
      expect(messages.first.text).to eq 'Hello'
    end
  end
end
