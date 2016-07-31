require './app/models/user.rb'

describe User do
  context "valid e-mail and password" do
    it "authenticates user" do
      user = User.create(email: "bob@gmail.com", password: 123)
      authenticated_user = User.authenticate("bob@gmail.com", 123)
      expect(authenticated_user).to eq user
    end
  end
  context "invalid e-mail and password" do
    it "does not authenticate user" do
      user = User.create(email: "bob@gmail.com", password: 123)
      expect(User.authenticate("bob@gmail.com", "wrong password")).to be_nil
    end
  end
end
