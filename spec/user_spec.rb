require 'user'
require 'pg'

describe User do
  describe '.create' do
    it 'creates new user' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'Ricky Martin', username: 'ricky_m')
      connection = PG.connect(dbname: 'chitter_test')
      result = connection.query("SELECT * FROM users WHERE id = #{user.id};")
      persisted_data = result.first

      expect(user).to be_a User
      expect(user.id).to eq persisted_data['id']
      expect(user.email).to eq 'test@example.com'
    end

    it 'uses bcrypt to hash password' do
      expect(BCrypt::Password).to receive(:create).with 'password123'
      User.create(email: 'test@example.com', password: 'password123', name: 'Ricky Martin', username: 'ricky_m')
    end
  end

  describe '.find' do
    it 'finds user with given id' do
      user = User.create(email: 'test@example.com', password: 'password123', name: 'Ricky Martin', username: 'ricky_m')
      user_found = User.find(id: user.id)

      expect(user_found.id).to eq user.id
      expect(user_found.username).to eq user.username
    end

    it 'returns nil if there is no id' do
      expect(User.find(id: nil)).to eq nil
    end
  end
end
