describe User do
  describe '.create' do
    it 'runs query to insert user data' do
      user = described_class.create(name: 'test', username: 'testname', email: 'test@test.com', password: 'Test123')
      query_user = DatabaseConnection.query("SELECT * FROM users").first

      expect(user.id).to eq query_user['id']
      expect(user.name).to eq query_user['name']
      expect(user.username).to eq query_user['username']
      expect(user.email).to eq query_user['email']
      expect(user.password).to eq query_user['password']
    end

    it 'encrypts the password' do
      expect(BCrypt::Password).to receive(:create).with('Test123')
      described_class.create(name: 'test', username: 'testname', email: 'test@test.com', password: 'Test123')
    end
  end

  describe '.find' do
    it 'finds user by their id' do
      user = described_class.create(name: 'test', username: 'testname', email: 'test@test.com', password: 'Test123')
      found_user = described_class.find(id: user.id)

      expect(user.id).to eq found_user.id
      expect(user.name).to eq found_user.name
      expect(user.email).to eq found_user.email
      expect(user.username).to eq found_user.username
      expect(user.password).to eq found_user.password
    end
  end

  describe '.authenticate' do
    it 'returns user for valid username and password' do
      user = described_class.create(name: 'test', username: 'testname', email: 'test@test.com', password: 'Test123')
      result = described_class.authenticate(username: 'testname', password: 'Test123')

      expect(result.id).to eq user.id
      expect(result.name).to eq user.name
      expect(result.email).to eq user.email
    end

    it 'returns nil for invalid username' do
      described_class.create(name: 'test', username: 'testname', email: 'test@test.com', password: 'Test123')
      result = described_class.authenticate(username: 'wrong_name', password: 'Test123')

      expect(result).to be_nil
    end

    it 'returns nil for incorrect password' do
      described_class.create(name: 'test', username: 'testname', email: 'test@test.com', password: 'Test123')
      result = described_class.authenticate(username: 'testname', password: 'wrong_password')

      expect(result).to be_nil
    end

    describe '.update' do
      it 'udpates user details' do
        user = described_class.create(name: 'test', username: 'testname', email: 'test@test.com', password: 'Test123')
        described_class.update(id: user.id, name: 'new_name', username: 'new_username', email: 'new_email')
        updated_user = described_class.find(id: user.id)
        expect(updated_user.name).to eq 'new_name'
        expect(updated_user.email).to eq 'new_email'
        expect(updated_user.username).to eq 'new_username'
      end
    end
  end
end
