describe 'User' do
  describe '#.create' do
    it 'creates a user' do
      user = User.create(email: 'peeping@peepers.com', password: 'SuperSecretPassword123')

      expect(user).to be_a User
      expect(user.email).to eq 'peeping@peepers.com'
    end
  end

  describe '#.find' do
    it 'finds a user by id' do
      user = User.create(email: 'peeping@peepers.com', password: 'SuperSecretPassword123')
      result = User.find(id: user.id)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end
  end
end