require 'user'
require 'database_helpers'

describe User do
  describe '#create' do
    it 'creates a new user' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'Valentina', username: 'ValentinaM')

      persisted_data = persisted_data(table: :users, id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'test@example.com'
      expect(user.name).to eq 'Valentina'
      expect(user.username).to eq 'ValentinaM'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')

      User.create(email: 'test@example.com', password: 'password123', name: 'Valentina', username: 'ValentinaM')
    end
  end

  describe '#find' do
    it 'finds a user by ID' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'Valentina', username: 'ValentinaM')

      result = User.find(user.id)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end

  describe '#authenticate' do
    context 'when valid credential details' do
      it 'returns a user given a correct username and password, if one exists' do
        user = User.create(email: 'test@example.com', password: 'password123', name: 'Valentina', username: 'ValentinaM')
        authenticated_user = User.authenticate(email: 'test@example.com', password: 'password123')

        expect(authenticated_user.id).to eq user.id
      end
    end

    context 'when email in invalid' do
      it 'returns nil given an incorrect email address' do
        user = User.create(email: 'test@example.com', password: 'password123', name: 'Valentina', username: 'ValentinaM')
        expect(User.authenticate(email: 'notmyemail@wrongemail.com', password: 'password123')).to be_nil
      end
    end

    context 'when password in invalid' do
      it 'returns nil given an incorrect password' do
        user = User.create(email: 'test@example.com', password: 'password123', name: 'Valentina', username: 'ValentinaM')
        expect(User.authenticate(email: 'test@example.com', password: 'wrongpassword')).to be_nil
      end
    end
  end
end
