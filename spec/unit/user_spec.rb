require 'user'
require 'database_helpers_spec'

describe User do

  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'jess@test.com', password: 'abcdef', handle: 'jesstest')

      persisted_data = persisted_data(table: :users, id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'jess@test.com'
    end
  end
end 
