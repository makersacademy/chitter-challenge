require 'user'
require 'database_helpers'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(
        email: 'test1@example.com',
        password: 'password123',
        name: 'Example Name',
        username: '@example_user1'
      )
      persisted_data = persisted_data(id: user.id, table: :users)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'test1@example.com'
      expect(user.name).to eq 'Example Name'
      expect(user.username).to eq '@example_user1'
    end

    describe '.find' do
      it 'returns nil if there is no ID given' do
        expect(User.find(id: nil)).to eq nil
      end

      it 'finds a user by ID' do
        user = User.create(
          email: 'test2@example.com',
          password: 'password123',
          name: 'Example Name',
          username: '@example_user2'
        )

        found_user = User.find(id: user.id)

        expect(found_user.id).to eq user.id
        expect(found_user.email).to eq user.email
        expect(found_user.name).to eq user.name
        expect(found_user.username).to eq user.username
      end 
    end
  end
end