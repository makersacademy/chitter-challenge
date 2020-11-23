require 'user'

describe User do

  describe '.create' do
    it 'creates a new user' do
      user = User.create(username: 'Username_test', email: 'signup@test.com', password: 'testpassword1')
      table_data = DatabaseConnection.query("SELECT * FROM users WHERE id = #{user.id};")

      expect(user).to be_a User
      expect(user.id).to eq table_data.first['id']
      expect(user.username).to eq 'Username_test'
    end
  end

  describe '.find' do
    it 'finds the user by an id' do
      user = User.create(username: 'Username_test', email: 'signup@test.com', password: 'testpassword1')
      search = User.find(id: user.id)

      expect(search.id).to eq user.id
      expect(search.username).to eq user.username
    end

    it 'returns nil if there is no id given' do
      expect(User.find(id: nil)).to eq nil
    end
  end
end
