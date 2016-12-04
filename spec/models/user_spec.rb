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

end
