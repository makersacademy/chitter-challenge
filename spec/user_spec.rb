require_relative '../app/models/user'

describe User do
  let(:user) do
    User.create(name: "Unit Test",
                username: "iamatest",
                email: "unit@test.com",
                password: "test123",
                password_confirmation: "test123")
  end

  describe "authenticate" do
    it "authenticates log in when given a valid email and password" do
      authenticated_user = User.authenticate(user.email, user.password)
      expect(authenticated_user).to eq user
    end

    it "does not authenticate log in when given a wrong email" do
      expect(User.authenticate("wrong_email", user.password)).to eq nil
    end

    it "does not authenticate log in when given a wrong password" do
      expect(User.authenticate(user.email, "wrong_pw")).to eq nil
    end
  end
end
