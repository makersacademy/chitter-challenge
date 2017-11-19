require "./app/models/user"

describe User do
  let(:subject) { described_class.new }
  let(:user) { User.create(name: "name", username: "username", email: "email", password: "password", password_confirmation: "password") }

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
    it 'should add a user' do
      expect{ User.create(name: "name", username: "username", email: "email", password: "password", password_confirmation: "password") }.to change { User.all.count }.by(1)
    end
  end
  describe "authenticate" do
    it 'authenticates when given a valid email address and password' do
      authenticated_user = User.authenticate(user.email, user.password)
      expect(authenticated_user).to eq user
    end
    it 'does not authenticate when given an incorrect email address and password combination' do
      authenticated_user = User.authenticate(user.email, "wrong password")
      expect(authenticated_user).to eq nil
    end
  end
end
