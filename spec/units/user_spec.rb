require 'user'

describe User do
  let(:test_user) { 'testusername' }

  let(:new_user) { { username: 'newuser',
                    name: 'New User',
                    email: 'new_user@example.com',
                    password: 'Password1'
                  } }

  describe '.all' do
    it 'returns an array of users' do
      expect(described_class.all.map(&:username)).to include test_user
    end
  end

  describe '.create' do
    it 'adds a user to the database' do
      described_class.create(new_user)
      expect(described_class.all.map(&:username)).to include new_user[:username]
    end

    it 'encrypts the password' do
      expect(BCrypt::Password).to receive(:create).with(new_user[:password])
      described_class.create(new_user)
    end
  end

  describe '.find_by_username' do
    it 'returns the correct user as a user object' do
      expect(described_class.find_by_username(test_user).name).to eq 'Test User'
    end
  end
end
