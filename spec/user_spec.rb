require 'user'
require 'database_helpers'

describe User do
  describe '.register' do
    it 'creates a new user in the database' do
      user = User.register(
        name: 'Nicole Kidman',
        email: 'nicole@kidman.com',
        username: 'nicole',
        password: 'emptycinema'
      )
      persisted_data = persisted_data(table: :users, id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id'].to_i
      expect(user.email).to eq 'nicole@kidman.com'
      expect(user.name).to eq 'Nicole Kidman'
      expect(user.username).to eq 'nicole'
    end
  end

  describe '.find_by_id' do
    it 'finds user by ID' do
      user = User.register(
        name: 'Nicole Kidman',
        email: 'nicole@kidman.com',
        username: 'nicole',
        password: 'emptycinema'
      )
      
      result = User.find_by_id(user.id)
      expect(result.id).to eq user.id
      expect(result.username).to eq user.username
    end
  end
end
