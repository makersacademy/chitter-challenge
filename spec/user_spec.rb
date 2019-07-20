require 'user'
require 'database_helpers'

describe User do
  describe '.create' do
    it 'Creates a new user' do
      user = User.create(email: "test@example.com", password: "1234", username: "test_user")

      persisted_data = persisted_data(id: user.id, table: :users)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'test@example.com'
    end
  end
end
