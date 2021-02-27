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
  end
end
