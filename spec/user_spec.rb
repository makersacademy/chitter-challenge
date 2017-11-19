require "./app/models/user"

describe User do
  let(:subject) { described_class.new }
  let(:user) { User.create(name: "name", username: "username", email: "email", password: "password") }

  describe "initialize" do
    it "can be initialized" do
      expect(subject).to be_an_instance_of(User)
    end
    it "has a name" do
      expect(user.name).to eq ("name")
    end
    it "has a username" do
      expect(user.username).to eq("username")
    end
    it "has an email address" do
      expect(user.email).to eq("email")
    end
  end
end
