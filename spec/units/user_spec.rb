require 'database_helpers'
require 'user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(name: 'Josie', email: 'test@example.com', password: 'password123')
      # puts "the user.id is: #{user.id}"
      # puts "the persisted_data.first id is: #{persisted_data.first}"
      # puts "the user.id is: #{user.id}"
      persisted_data = persisted_data(table: :users, id: user.id)
      # p persisted_data.first
      expect(user).to be_a User
      expect(user.name).to eq 'Josie'
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'test@example.com'

    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(name: 'Josie', email: 'test@example.com', password: 'password123')
      # p user.id.class
      result = User.find(user.id)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end
    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end
end
