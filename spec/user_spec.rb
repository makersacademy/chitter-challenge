require 'user'

describe User do
  describe '#create' do
    it 'creates a new user' do
      user = User.create(email: 'dione@gmail.com', password: 'password5678',
        name: 'Dione', username: 'dione-dls')
      expect(user.id).not_to be_nil
    end
  end

  describe '#all' do
    it 'returns all users, wrapped in a User instance' do
      user = User.create(email: 'dione@gmail.com', password: 'password5678',
        name: 'Dione', username: 'dione-dls')
      expect(User.all.map(&:id)).to include user.id
    end
  end
end
