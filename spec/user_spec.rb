require 'user'

describe User do

  describe '.all' do
    it 'shows all existing users wrapped in a User instance' do
      user_1 = User.create(name: 'testuser_1', email: 'test_1@example.com', password: 'testpw1')
      user_2 = User.create(name: 'testuser_2', email: 'test_2@example.com', password: 'testpw2')
      users = User.all
      expect(users.length).to eq(2)
      expect(user_1).to be_a(User)
      expect(user_1).to respond_to(:id)
      expect(user_1).to respond_to(:password)
      expect(user_2.name).to eq('testuser_2')
      expect(user_2.email).to eq('test_2@example.com')
    end
  end
  describe '.create' do
    it 'adds a new user' do
      user = User.create(name: 'testuser', email: 'test@example.com', password: 'testpw1')
      # persisted_user = persisted_data(table: :users, id: user.id).first

      expect(user).to be_a(User)
      expect(user).to respond_to(:id)
      # expect(user.id).to eq(persisted_user.id)
      expect(user.name).to eq('testuser')
      # expect(user.name).to eq(persisted_user.name)
      expect(user.email).to eq('test@example.com')
      # expect(user.email).to eq(persisted_user.email)
      expect(user.password).to eq('testpw1')
      # expect(user.password).to eq(persisted_user.password)
    end
  end

  describe '.find' do
    it 'finds specific users by their id' do
      user = User.create(name: 'testuser', email: 'test@example.com', password: 'testpw1')
      found_user = User.find(id: user.id)
      expect(found_user.id).to eq(user.id)
      expect(found_user.name).to eq(user.name)
    end
    it 'returns nil if no ID is given' do
      expect(User.find(id: nil)).to eq(nil)
    end
  end
end
