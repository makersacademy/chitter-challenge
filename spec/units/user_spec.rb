require 'user'
require 'database_helpers'

describe User do
  describe '.create' do
    it 'creates a user with email, password, name and username' do
      user = User.create(\
        email: "edina@chitter.com", \
        password: "PaSsWoRd", \
        name: "Edina", \
        username: "edinaB"
      )

      persisted_data = persisted_data(table: :users, id: user.id)

      expect(user).to be_a(User)
      expect(user.id).to eq(persisted_data.first['id'])
      expect(user.email).to eq("edina@chitter.com")
      expect(user.name).to eq("Edina")
      expect(user.username).to eq("edinaB")
    end
  end

  describe '.find' do
    it 'returns user when user can be found with the given id' do
      user = User.create(\
        email: "edina@chitter.com", \
        password: "PaSsWoRd", \
        name: "Edina", \
        username: "edinaB"
      )

      expect(User.find(id: user.id)).to eq(user)
    end

    it 'returns nil when user cannot be found with the given id' do
      expect(User.find(id: -1)).to eq(nil)
    end
  end

  describe '#!=' do
    it 'returns true if two users are different' do
      first_user = User.create(\
        email: "edina@chitter.com", \
        password: "PaSsWoRd", \
        name: "Edina", \
        username: "edina"
      )

      second_user = User.create(\
        email: "edinaB@chitter.com", \
        password: "PaSsWoRd", \
        name: "Edina", \
        username: "edinaB"
      )

      expect(first_user != second_user).to eq(true)
    end

    it 'returns false if two users are the same' do
      first_user = User.create(\
        email: "edina@chitter.com", \
        password: "PaSsWoRd", \
        name: "Edina", \
        username: "edinaB"
      )

      second_user = first_user.clone

      expect(first_user != second_user).to eq(false)
    end
  end
end
