require 'users'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'think@yahoo.com', password: 'secret', name: 'Zelda', username: 'dog')
      id = user.id
      persisted_data = persisted_data(table: 'users', id: id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data['id']
      expect(user.email).to eq 'think@yahoo.com'
      expect(user.name).to eq 'Zelda'
      expect(user.username).to eq 'dog'
    end
  end
end
