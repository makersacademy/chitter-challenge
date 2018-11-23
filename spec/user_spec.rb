require 'user'

describe User do

  describe ".sign_up" do
    it "will create an account for a user with a username and password" do
      user = User.sign_up("Turbo123", "password101")
      expect(user.user_name).to eq("Turbo123")
    end
  end

    it "encrypts the password" do
      expect(BCrypt::Password).to receive(:sign_up).with('password123')

      User.sign_up("Johnny101", "password123")
    end

  describe ".user_name_available?" do
    it "will check whether the user_name is already in use" do

      User.sign_up("Ben10", "xy1092")

      expect{ User.sign_up("Ben10", "123helo") }.to raise_error("User already exists")
    end

  end

  describe ".login" do
    it "will check login details against the users database" do
      user_sign_up = User.sign_up("Tommy", "wordpass23")

      user_login = User.login("Tommy", "wordpass23")

      expect(user_sign_up.user_id).to eq(user_login.user_id)
    end

    it "will throw an error if the login details aren't correct" do
      expect{ User.login("Ben11", "123h") }.to raise_error("Incorrect username or password")
    end
  end
end
