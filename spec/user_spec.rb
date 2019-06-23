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

  describe '.find' do
    it 'finds and returns user by user id' do
      user = User.create(name: 'John', username: 'John1',
         email: 'john@test.com', password: 'password123')
      found_user = User.find(id: user.id)


      expect(found_user.name).to eq user.name
      expect(found_user.username).to eq user.username
    end
  end
end
