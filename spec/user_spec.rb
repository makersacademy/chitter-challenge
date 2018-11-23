describe User do
  describe '.find' do
    it 'returns an integer if user exists' do
      expect(User.find_id('hulbgoblin')).to eq 1
    end
  end

  describe '.create' do
    it 'creates a new user' do
      user = User.create(name: 'Tom Eade', username: 'demondeathcharge_tje',
                        email: 'tom@gmail.com', password: 'I<3Chloe').first
      persisted_data = persisted_data(table: 'users', id: user['id'])

      expect(user['id']).to eq persisted_data['id']
      expect(user['name']).to eq persisted_data['name']
      expect(user['username']).to eq persisted_data['username']
      expect(user['email_address']).to eq 'tom@gmail.com'
    end
  end
end
