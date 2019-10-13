require 'messages'
require 'users'

describe Chitter do
  describe '#create_message' do
    it 'create a new message in database' do
      user = Chitter.create_user('test@test.com', 'password', 'John Doe', 'J')
      message = Chitter.create_message('Hello', user)
      expect(message).to be_a Messages
    end
  end

  describe '#create_user' do
    it 'insert a new user in database' do
      user = Chitter.create_user('test@test.com', 'password', 'John Doe', 'J')
      expect(user).to be_a Users
    end

    it 'not create a user if not unique' do
      Chitter.create_user('test@test.com', 'password', 'John Doe', 'J')
      expect(Chitter.create_user('test@test.com', 'password', 'John Doe', 'J')).to eq false
    end
  end

  describe '#user_log_in' do
    it 'with correct email and password' do
      user = Chitter.create_user('test@test.com', 'password', 'John Doe', 'J')
      expect(Chitter.user_log_in(user.email, 'password')).to be_a Users
    end

    it 'with incorrect email and password' do
      user = Chitter.create_user('test@test.com', 'password', 'John Doe', 'J')
      expect(Chitter.user_log_in(user.email, 'wrong')).to eq false
    end
  end

  describe '#show_all_messages' do
    it 'shows all the messages' do
      user1 = Chitter.create_user('test@test.com', 'password', 'John Doe', 'J')
      user2 = Chitter.create_user('test2@test.com', 'password', 'John Doe 2', 'J 2')
      Chitter.create_message('Hello', user1)
      Chitter.create_message('Hello Chitter', user2)
      messages = Chitter.show_all_messages
      expect(messages.first.text).to eq 'Hello'
    end
  end
end
