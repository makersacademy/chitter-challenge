require 'user'

describe User do
  describe '#create' do
    it 'creates a new user' do
      users = User.create(name: 'Tara', username: 'Tara.s')

      expect(users.name).to eq 'Tara'
      expect(users.username).to eq 'Tara.s'
    end
  end
end
