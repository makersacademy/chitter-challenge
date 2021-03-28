require 'message'
require 'pg'

describe Message do
  describe '.add' do
    it 'creates and return new message' do
      user = User.create('test7@example.com', 'password123', 'test7', 'test7')
      message = Message.add('chit chit', user.id)
      expect(message.content).to eq 'chit chit'
      expect(message.username).to eq 'test7'
    end
  end

  describe '.all' do
    it 'call for all messages' do
      expect(Message.all.first).to be_a Message
    end
  end

  describe '#tagged_user_emails' do
    it 'return tagged user email' do
      poster = User.create('test8@example.com', 'password123', 'test8', 'test8')
      tagged = User.create('test9@example.com', 'password123', 'test9', 'test9')
      message = Message.add("chit chit @#{tagged.username}", poster.id)
      expect(message.tagged_user_emails).to include "#{tagged.email}"
    end
  end
end