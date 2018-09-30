require 'user'

describe User do
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
end
