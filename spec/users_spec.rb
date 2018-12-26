require 'database_helpers'

describe Users do
  describe '#create' do
    it 'can sign up a user and add thier details to the database' do
      table = "users"
      user = Users.create("Someone233", "abcd1234", "someone233@hotmail.com", "Someone", "Somebody")
      persisted_data = persisted_user_data(user.username)

      expect(user.id).to eq persisted_data['id']
      expect(user.forename).to eq persisted_data['forename']
      expect(user.username).to eq persisted_data['username']
      expect(user.password).to eq persisted_data['password']
      expect(user.email).to eq persisted_data['email']
    end

    it 'can create a hashed/encrypted password with BCrypt' do
      user = Users.create("Someone233", "abcd1234", "someone233@hotmail.com", "Someone", "Somebody")
      encrypted = BCrypt::Password.new(user.password).instance_of? BCrypt::Password
      expect(user.password.length).to eq 60
      expect(encrypted).to be(true)
    end
  end

  describe '#read' do
    it "can return all users in the database" do
      3.times do |count|
        Users.create("Someone#{count}", "abcd123#{count}", "someone#{count}@hotmail.com", "Someone", "Somebody")
      end
      users = Users.read
      expect(users.length).to eq(3)
      expect(users[0].username).to eq("Someone0")
      expect(users[1].username).to eq("Someone1")
      expect(users[2].username).to eq("Someone2")
    end
  end

  describe '#find' do
    it "can find a specific user by username and return their record" do
      3.times do |count|
        Users.create("Someone#{count}", "abcd123#{count}", "someone#{count}@hotmail.com", "Someone", "Somebody")
      end
      user = Users.find("Someone1")
      expect(user[0].username).to eq("Someone1")
      expect(user[0].email).to eq("someone1@hotmail.com")
    end
  end

  describe '#login' do
    it "can determine if the correct password has been given for a record" do
      3.times do |count|
        Users.create("Someone#{count}", "abcd123#{count}", "someone#{count}@hotmail.com", "Someone", "Somebody")
      end
      expect(Users.login("Someone1", "abcd1231")).to eq(true)
      expect(Users.login("Someone1", "abcd1234")).to eq(false)
    end
  end
end
