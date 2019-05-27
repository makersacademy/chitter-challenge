require_relative '../lib/users'
describe 'Users' do

  describe '.create' do
    it 'can create a new user' do
      user = User.create(name: 'Lucy Barber', username: 'lbarber729', email: 'lucy@email.com', password: 'Password123')

      expect(user.name).to eq('Lucy Barber')
      expect(user.username).to eq('lbarber729')
      expect(user.email).to eq('lucy@email.com')
    end
  end

  describe '.find' do
    it 'can find a user' do
      User.create(name: 'Lucy Barber', username: 'lbarber729', email: 'lucy@email.com', password: 'Password123')
      found = User.find(email: 'lucy@email.com', password: 'Password123')

      expect(found).to eq({ 'name' => 'Lucy Barber', 'username' => 'lbarber729' })
    end
  end

end
