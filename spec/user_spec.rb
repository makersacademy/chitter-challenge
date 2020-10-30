require 'user'

describe User do
  describe '.create' do
    it 'creates and adds a new user' do
      test_user = User.create(email: 'test@example.com', password: 'password123', name: 'John User', username: 'john82')
      test_data = persisted_data(table: :users, id: test_user.id)
      p test_data.first
      expect(test_user).to be_a User
      expect(test_user.id).to eq test_data.first['id']
      expect(test_user.email).to eq('test@example.com')
    end
  end
end
