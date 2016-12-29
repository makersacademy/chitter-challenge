describe User do

  let(:user) {User.create(email: "abc@gmail.com", name: "abc",
                          username: "abc123", password: "password",
                          password_confirmation: "password")}

  describe "Authentication" do

    it "returns the user if the password is correct" do

      authenticated_user = User.authenticate(user.email, user.password)
      expect(authenticated_user).to eq user
    end

    it "returns nil if the password is incorrect" do
      unauthenticated_user = User.authenticate(user.email, "wrong password")
      expect(unauthenticated_user).to eq nil
    end

  end

  describe "Resetting Password" do

    it "saves the password token when a token is generated" do
      expect{user.generate_token}.to change{user.password_token}
    end

    it "initiates a password token time when a token is generated" do
      Time.freeze do
        user.generate_token
        expect(user.password_token_time).to eq Time.now
      end
    end

    it "finds a user with a valid token" do
      user.generate_token
      expect(User.find_by_valid_token(user.password_token)).to eq user
    end

    it "does not find a user with a valid token after one hour" do
      user.generate_token
      Timecop.travel(3600+1) do
        expect(User.find_by_valid_token(user.password_token)).to eq nil
      end
    end


  end

end
