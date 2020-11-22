describe User do

  describe '.all' do
    it 'returns a list of users' do
      connection = PG.connect(dbname: 'chitter_test')

      user = create_user(username: "Test user 1")
      create_user(username: "Test user 2")
      create_user(username: "Test user 3")

      users = User.all
      expect(users.length).to eq 3
      expect(users.first).to be_a User
      expect(users.first.id).to eq user.id
      expect(users.first.username).to eq user.username
    end
  end


  describe '.create' do
    it 'creates a new user' do
      user = create_user(username: 'Test user')
      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM users WHERE id = #{user.id};")

      expect(user).to be_a User
      expect(user.username).to eq persisted_data.first['username']
    end
  end

  def create_user(username:)
    User.create(username: username, email: username + '@example.com', password: 123123123123)
  end
end
