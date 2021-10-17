require "user"

describe User do

    let(:message_class) { double(:message_class) }
  
    describe '#messages' do
    it 'calls .where on the Message class' do
      user = User.create(username: 'username1234', password: '123457jghjhgj', password_confirmation: '123457jghjhgj')
      expect(message_class).to receive(:where).with(user_id: user.id)
  
      user.messages(message_class)
    end
  end
  
     describe '.create' do
      it 'does not create a new user if the username is taken' do
        User.create(username: 'username1234', password: '123457jghjhgj', password_confirmation: '123457jghjhgj')
        user = User.create(username: 'username1234', password: '123457jghjhgj', password_confirmation: '123457jghjhgj')
        expect(user).to be_falsy
      end
    end
  
    describe '.find' do
      it 'returns the requested user object' do
        user = User.create(username: 'username1234', password: '123457jghjhgj', password_confirmation: '123457jghjhgj')
  
        result = User.find(id: user.id)
  
        expect(result).to be_a User
        expect(result.id).to eq user.id
        expect(result.username).to eq 'username1234'
      end
    end

    describe '.log_in' do
        it 'returns the requested user object on log in' do
          user = User.create(username: 'username1234', password: '123457jghjhgj', password_confirmation: '123457jghjhgj')
    
          result = User.log_in(username: 'username1234', password: '123457jghjhgj')
    
          expect(result).to be_a User
          expect(result.id).to eq user.id
          expect(result.username).to eq 'username1234'
        end
      end
  
    describe '#messages' do
      it 'returns a list of messages of the user' do
        user = User.create(username: 'username1234', password: '123457jghjhgj', password_confirmation: '123457jghjhgj')
        DatabaseConnection.query("INSERT INTO messages (id, text, user_id) VALUES(1, 'Test message', $1)", [user.id] )
        message = user.messages.first
  
        expect(message.text).to eq 'Test message'
      end
    end
  end 