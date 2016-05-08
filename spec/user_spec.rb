require "./app/models/user"

describe User do

  subject(:user) do
    User.create(name: "Amy",
                username: "amynic",
                email: "amy@gmail.com",
                password: "my_password")
  end

  describe "authenticating user on login" do
    context "when valid email and password" do
      it "authenticates and returns the user" do
        authenticated_user = User.authenticate(user.email, user.password)
        expect(authenticated_user).to eq user
      end
    end

    context "when unregistered user" do
      it "does not authenticate and returns nil" do
        expect(User.authenticate("random@gmail.com", user.password)).to be_nil
      end
    end

    context "when wrong password" do
      it "does not authenticate and returns nil" do
        expect(User.authenticate(user.email, "wrong_password")).to be_nil
      end
    end
  end

  describe "setting password attribute" do
    it "expects password attribute to equal given password" do
      expect(user.password).to eq "my_password"
    end
  end
end
