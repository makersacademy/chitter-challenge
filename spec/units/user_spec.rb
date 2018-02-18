require 'user'

describe User do
  let(:test_user) { { username: 'testusername' } }

  let(:new_user) { { username: 'newuser',
                    name: 'New User',
                    email: 'new_user@example.com',
                    password: 'Password1'
                  } }

  describe '.all' do
    it 'returns an array of users' do
      expect(described_class.all).to include(include(test_user))
    end
  end

  describe '.create' do
    it 'adds a user to the database' do
      described_class.create(new_user)
      expect(described_class.all).to include(include( {username: new_user[:username] }))
    end
  end
end
