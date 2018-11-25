require 'user'

describe User do

  describe '.create' do
    it 'creates a new user' do
      user = User.create(name: 'Darryl Banks', email: 'test@example.com',
        user_name: 'dazza', password: 'password123')

      expect(user).to be_a User
      expect(user.email).to eq 'test@example.com'
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(name: 'Darryl Banks', email: 'test@example.com',
        user_name: 'dazza', password: 'password123')
      result = User.find(user.id)

      expect(result.id).to eq user.id
      expect(result.name).to eq user.name
      expect(result.email).to eq user.email
      expect(result.user_name).to eq user.user_name
    end
  end
end
