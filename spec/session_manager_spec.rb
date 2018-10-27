require 'session_manager'
require 'database_manager'

describe SessionManager do
  let(:user_class) { double(:user_class) }
  let(:user) { double(:user) }

  describe '::authenticate' do
    it 'should create new instance of authenticated user' do
      email, password = 'albob123@gmail.com', 'password123'
      allow(DatabaseManager).to receive_message_chain(:query, :first).and_return user
      allow(user).to receive(:[]).with('password').and_return password
      expect(DatabaseManager).to receive(:query).with("SELECT * FROM users WHERE email = '#{email}';")
      expect(user_class).to receive(:create_instance).with(user)
      described_class.authenticate(email, password, user_class)
    end

    it 'should not return user info for an incorrect email' do
      email, password = '123albob@gmail.com', 'password123'
      expect(described_class.authenticate(email, password)).to eq false
    end

    it 'should not return user info for an incorrect password' do
      email, password = 'albob123@gmail.com', '123password'
      expect(described_class.authenticate(email, password)).to eq false
    end
  end
end
