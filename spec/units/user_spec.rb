require 'user'

describe User do
  describe '#initialize' do
    it 'stores name, username, email, and password' do
      user = User.new(id: 1, name: "Charlie", username: "charlie123", email: "charlie@emailhost.com", password: "password321")
      expect(user.id).to eq(1)
      expect(user.name).to eq("Charlie")
      expect(user.username).to eq("charlie123")
      expect(user.email).to eq("charlie@emailhost.com")
      expect(user.password).to eq("password321")
    end
  end

  describe '#create' do
    it 'creates a new user in the Chitter database' do
      user = User.create(name: "Charlie", username: "charlie123", email: "charlie@emailhost.com", password: "password321")
      db = PG.connect(dbname: 'chitter_test')
      users = db.query("SELECT * FROM users WHERE id = #{user.id};")

      expect(user.id).to eq(users.first['id'])
      expect(user.name).to eq("Charlie")
      expect(user.username).to eq("charlie123")
      expect(user.email).to eq("charlie@emailhost.com")
      expect(user.password).to eq("password321")
    end
  end

  describe '#last' do
    it 'should return most recently added instance of User' do
      user = User.create(name: "Charlie", username: "charlie123", email: "charlie@emailhost.com", password: "password321")

      new_user = User.last

      expect(new_user).to be_instance_of(User)
      expect(new_user.id).to eq(user.id)
      expect(new_user.name).to eq(user.name)
      expect(new_user.username).to eq(user.username)
      expect(new_user.email).to eq(user.email)
      expect(new_user.password).to eq(user.password)
    end
  end
end
