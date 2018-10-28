require 'user'
require 'database_helpers'

describe User do

  describe '::create' do

    it 'creates a new user' do
      user = User.create(email: 'test@example.com', password: 'password123')
      persisted_data = persisted_data(id: user.id, table: 'users')
      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'test@example.com'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
      User.create(email: 'test@example.com', password: 'password123')
    end

  end

  describe '::find' do

    it 'returns the user' do
      result = User.find(id: '1')
      expect(result.id).to eq '1'
      expect(result.email).to eq 'harry@enfield.com'
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(id: nil)).to eq nil
    end

  end

  describe '::authenticate' do

    it 'returns a user given a correct username and password, if one exists' do
      authenticated_user = User.authenticate(email: 'harry@enfield.com', password: 'password')
      expect(authenticated_user.id).to eq '1'
    end

    it 'returns nil given an incorrect email address' do
      expect(User.authenticate(email: 'nottherightemail@me.com', password: 'password123')).to be_nil
    end

    it 'returns nil given an incorrect password' do
      expect(User.authenticate(email: 'test@example.com', password: 'wrongpassword')).to be_nil
    end

  end

end
