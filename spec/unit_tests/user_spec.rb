require 'database_helpers'
require 'user'

describe User do 
  describe '.create' do
    it 'creates a new user' do
      user = User.create(name: 'Ania', username: 'an', email: 'an@email.com', password: 'a1')

      persisted_data = persisted_data(table: :users, id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data['id']
      expect(user.email).to eq 'an@email.com'
      expect(user.name).to eq 'Ania'
      expect(user.username).to eq 'an'
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(name: 'Ania', username: 'an', email: 'an@email.com', password: 'a1')
      result = User.find(id: user.id)
  
      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
      expect(result.name).to eq user.name
      expect(result.username).to eq user.username
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(id: nil)).to eq nil
    end
  end

  describe '.authenticate' do 
    context 'when user exist and password is correct' do 
      it 'logs users in ' do 
        user = User.create(name: 'Ania', username: 'an', email: 'an@email.com', password: 'a1')
        authenticated_user_id = User.authenticate(email: 'an@email.com', password: 'a1')

        expect(authenticated_user_id).to eq user.id
      end
    end 
  end
end
