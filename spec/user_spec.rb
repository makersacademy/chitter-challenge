
require 'user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create('testuser', 'test@test.com', 'jedi')
      persisted_data = persisted_data(table: :users, id: :user.id)
      expect(user).to be_a User
      # expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'test@test.com'
    end
  end
end
