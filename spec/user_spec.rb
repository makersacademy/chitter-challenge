describe User do
  describe 'Display all Users' do
    it 'returns all Users' do
      connection = PG.connect(dbname: 'chitter_db_test')
      connection.exec("INSERT INTO users (username, tag) VALUES ('Neil', '@Br0ckers');")

       users = User.all
      expect(users).to include({username: 'Neil', tag: '@Br0ckers', date: (/2018-10/) })
    end
  end
  describe 'Display last User' do
    it 'returns last user' do
      connection = PG.connect(dbname: 'chitter_db_test')
      connection.exec("INSERT INTO users (username, tag) VALUES ('Neil', '@Br0ckers');")

       user = User.last
      expect(user).to include({username: 'Neil'})
    end
  end
end
