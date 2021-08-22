require 'user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = described_class.create(email: 'test@example.com', password: 'password123', name: 'testname', username: 'username')
      expect(user.id).not_to eq nil
      expect(user.email).to eq "test@example.com"
      expect(user.password).to eq "password123"
      expect(user.name).to eq "testname"
      expect(user.username).to eq "username"
    end
  end
end