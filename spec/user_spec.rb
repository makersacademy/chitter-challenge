require 'user'
require 'database_helpers'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(
        name: 'Example Name',
        username: 'exampleusername',
        email: 'example@example.com',
        password: 'examplepassword'
      )
      persisted_data = persisted_data(id: user.id, table: 'users')

      expect(user).to be_a(User)
      expect(user.id).to eq(persisted_data['id'])
      expect(user.name).to eq('Example Name')
      expect(user.username).to eq('exampleusername')
      expect(user.email).to eq('example@example.com')
      expect(user.password).to eq('examplepassword')
    end
  end
end
