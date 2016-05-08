require "./app/models/user"

describe User do

  subject(:user) do
    User.create(name: "Amy",
                username: "amynic",
                email: "amy@gmail.com",
                password: "my_password",
                password_confirmation: "my_password")
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

  describe "generating a password token" do
    it "stores a token in the database" do
      expect{user.store_token}.to change{user.password_token}
    end
  end

  describe "find a user by their token" do
    context "when token is valid" do
      it "returns a user" do
        user.store_token
        expect(User.find_by_token(user.password_token)).to eq user
      end
    end

    context "when token is invalid (over an hour since generated)" do
      it "returns nil" do
        user.store_token
        Timecop.travel(60 * 60 + 1) do
          expect(User.find_by_token(user.password_token)).to eq nil
        end
      end
    end
  end
end
