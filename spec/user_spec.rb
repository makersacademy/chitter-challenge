require 'user'

describe User do
  # describe ".check_login_details" do
  #   it "will check whether the sign in details entered by a user are already on the system" do
  #
  #     User.sign_up("Ben10", "xy1092") # May want to check oit without the password
  #     User.sign_up("Ben10", "xy1092")
  #
  #     expect{ User.check_login_details("Ben10", "xy1092") }.to raise_error("User already exists")
  #
  #   end
  # end

  describe ".signup" do
    it "will create an account for a user with a username and password" do
      user = User.sign_up("Turbo123", "password101")
      expect(user.user_name).to eq("Turbo123")
    end
  end

  describe ".login" do

  end
end
