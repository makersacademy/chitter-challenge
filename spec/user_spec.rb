describe User do

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(name: "John Doe", username: "john", email: 'test@example.com', password: 'password123')
      result = User.find(user.id)
  
      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
  
      user = User.encrypt('password123')
    end
  end

end