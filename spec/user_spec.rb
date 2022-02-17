require_relative '../lib/user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'test@example.com', password: 'password123')
      persisted_user = User.find_by_id(id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_user.id
      expect(user.email).to eq persisted_user.email
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
  
      User.create(email: 'test@example.com', password: 'password123')
    end

  end

  describe ".find_by_id" do
    it 'finds a user by ID' do
      user = User.create(email: 'test@example.com', password: 'password123')
      persisted_user = User.find_by_id(id: user.id)
  
      expect(persisted_user.id).to eq user.id
      expect(persisted_user.email).to eq user.email
    end

    it 'returns nil if there is no ID given' do
      expect(User.find_by_id(id: nil)).to eq nil
    end
  end

end
