require 'user'

describe User do

  describe ".create_user" do

    it "stores new users in the database" do
      connection = PG.connect(dbname: 'chitter_test')
      user = User.create_user(username: 'claude', password: 'meow')

      expect(user.username).to eq("claude")
      expect(user.password).to eq("meow")
    end

  end

  describe ".find_user" do

    it "finds a user in the database" do

      connection = PG.connect(dbname: 'chitter_test')
      User.create_user(username: 'claude', password: 'meow')
      check_user = User.find_user(username: 'claude')
      expect(check_user).to be(true)

    end

    it "returns false if the user is not in the database" do

      connection = PG.connect(dbname: 'chitter_test')
      check_user = User.find_user(username: "test_test")
      expect(check_user).to be(false)

    end


  end

  describe '.check_password' do

    it "returns true if the user is in the database and password is correct" do

      connection = PG.connect(dbname: 'chitter_test')
      user = User.create_user(username: 'claude', password: 'meow')
      check_user = User.find_user(username: "claude")
      expect(check_user).to be(true)

    end

    it "returns false if the user is in the database and password is incorrect" do

      connection = PG.connect(dbname: "chitter_test")
      user = User.create_user(username: 'claude', password: 'meow')
      check_user = User.check_password(username: "claude", password: "purr")
      expect(check_user).to be(false)

    end


  end

end
