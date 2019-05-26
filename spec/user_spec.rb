require 'user'
require 'database_helpers'

describe User do
  describe '#sign_up' do
    it 'should add a user to the database' do
      user = User.sign_up(email: 'test@test.com', password: 'password123',
                          name: 'test user', username: 'test_user')

      persisted_data = persisted_data_users(id: user.id)

      expect(user.id).to eq(persisted_data.first['id'])
      expect(user.email).to eq('test@test.com')
      expect(user.name).to eq('test user')
      expect(user.username).to eq('test_user')
    end
  end
end
