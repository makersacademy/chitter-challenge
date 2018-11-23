require 'user'

describe User do

  describe ".signup" do
    it "will create an account for a user with a username and password" do
      user = User.sign_up("Turbo123", "password101")
      expect(user.user_name).to eq("Turbo123")
    end
  end

  describe ".user_name_available?" do
    it "will check whether the user_name is already in use" do

      User.sign_up("Ben10", "xy1092")

      expect{ User.sign_up("Ben10", "123helo") }.to raise_error("User already exists")

    end
  end

  describe ".login" do

  end
end
