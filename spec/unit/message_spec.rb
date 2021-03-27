require 'message'
require 'pg'

describe Message do
  # add
  describe '.add' do
    it 'creates and return new message' do
      user = User.create('test7@example.com', 'password123', 'test7', 'test7')
      message = Message.add('chit chit', user.id)
      expect(message.content).to eq 'chit chit'
      expect(message.username).to eq 'test7'
    end
  end

  # all
  describe '.all' do
    it 'call for all messages' do
      expect(Message.all.first).to be_a Message
    end
  end

  # tag


end