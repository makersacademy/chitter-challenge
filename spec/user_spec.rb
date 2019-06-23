require 'user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(name: 'John', username: 'John1',
         email: 'john@test.com', password: 'password123')

      expect(user).to be_a User
      expect(user.name).to eq 'John'
      expect(user.username).to eq 'John1'
    end
  end
end
