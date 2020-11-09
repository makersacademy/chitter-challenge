require 'user'

describe User do
  let(:test_user) { User.create(email: 'test@example.com', password: 'password123', name: 'John User', username: 'john82') }

  describe '.create' do
    it 'creates and adds a new user' do
      test_data = persisted_data(table: :users, id: test_user.id)
      expect(test_user).to be_a User
      expect(test_user.id).to eq test_data.first['id']
      expect(test_user.email).to eq('test@example.com')
    end
  end

  describe '.find' do
    it 'returns a user based on the id' do
      result = User.find(id: test_user.id)
      expect(result.email).to eq test_user.email
    end
    it 'returns nil if there is no id' do
      expect(User.find(id: nil)).to eq nil
    end
  end

  describe '.email_exists?' do
    it 'returns true if the email exists' do
      expect(User.email_exists?(test_user.email)).to eq true
    end
    it 'returns false if the email does not exist' do
      expect(User.email_exists?('new_email@example.com')).to eq false
    end
  end

  describe '.username_exists?' do
    it 'returns true if the email exists' do
      expect(User.username_exists?(test_user.username)).to eq true
    end
    it 'returns false if the email does not exist' do
      expect(User.username_exists?('Dave')).to eq false
    end
  end

  describe '.authenticate' do
    it 'returns user based on email and password, if it exists' do
      test_user
      authenticated_user = User.authenticate(email: 'test@example.com', password: 'password123')
      expect(test_user.id).to eq authenticated_user.id
    end

    it 'returns nil if email does not exist' do
      User.create(email: 'dave.test@example.com', password: 'password123', name: 'John User', username: 'john82')
      expect(User.authenticate(email: 'test@example.com', password: 'passw0rd')).to be_nil
    end

    it 'returns nil if password is incorrect' do
      User.create(email: 'test@example.com', password: 'password123', name: 'John User', username: 'john82')
      expect(User.authenticate(email: 'test@example.com', password: 'password')).to be_nil
    end
  end
end
