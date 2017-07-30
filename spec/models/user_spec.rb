describe User do
  let!(:user) do
    User.create(username: "penfold", email: "hamster@dmhideout.com",
                password: "crumbs", password_confirmation: "crumbs")
  end

  describe ".authenticate" do
    it "authenticates when given a valid username and password" do
      authenticated_user = User.authenticate(user.username, user.password)
      expect(authenticated_user).to eq user
    end

    it "does not authenticate when given the wrong password" do
      expect(User.authenticate(user.username, "ohheck")).to be_nil
    end
  end

  describe ".tagged" do
    it "retrieves a user by their username" do
      expect(User.tagged(user.username)).to eq user
    end
  end
end
