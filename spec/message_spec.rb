require 'message'

describe Message do

  describe '.all' do

    it 'returns all messages' do
      # Add the test data
      user = User.sign_up(email: "test@mail.com", password: "password")
      message = Message.create(msg: "hello world", user_id: user.id)
      Message.create(msg: "i love kimchi", user_id: user.id)
      Message.create(msg: "donuts, amirite?", user_id: user.id)
      
      messages = Message.all

      # this tests that the Message object returns the same data we input into the database, 
      # basically, that our object behaves the way we want it to
      expect(messages.length).to eq 3
      expect(messages.first).to be_a Message
      expect(messages.first.id).to eq message.id
      expect(messages.first.user_id).to eq message.user_id
      expect(messages.first.msg).to eq 'hello world'
    end
  end

  describe ".create" do

    it "creates a new chitter message" do
      user = User.sign_up(email: "test@mail.com", password: "password")
      message = Message.create(msg: "hello world", user_id: user.id)
      expect(message).to be_a Message
      expect(message.msg).to eq 'hello world'
      expect(message.user_id).to eq user.id
    end

  end

end
