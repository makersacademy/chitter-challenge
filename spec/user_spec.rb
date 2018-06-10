require './lib/user'
describe User do
  describe '#create' do
    it 'creates a new user' do
      user = User.create(
        email: 'test@example.com',
        username: 'tester',
        name: 'John Doe',
        password: 'hunter123',
        password_confirm: 'hunter123')
      expect(user.id).not_to be_nil
    end
  end

  describe '#all' do
    it 'returns all the users, as user instances' do
      user = User.create(
        email: 'test@example.com',
        username: 'tester',
        name: 'John Doe',
        password: 'hunter123',
        password_confirm: 'hunter123')
      expect(User.all.map(&:id)).to include user.id
    end
  end

  describe '#find' do
    it 'finds a user using the id' do
      user = User.create(
        email: 'test@example.com',
        username: 'tester',
        name: 'John Doe',
        password: 'hunter123',
        password_confirm: 'hunter123')
      expect(User.find(user.id).email).to eq user.email
    end
    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end

end
