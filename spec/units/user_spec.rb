describe User do

  subject(:user) { described_class.create(name: "Firstname Lastname", username: "username", email: "email@email.com", password: "password") }

  describe "#name" do
    it "returns full name of user" do
      expect(user.name).to eq "Firstname Lastname"
    end
  end

  describe "#username" do
    it "returns username of user" do
      expect(user.username).to eq "username"
    end
  end

  describe "#email" do
    it "returns email of user" do
      expect(user.email).to eq "email@email.com"
    end
  end

  describe "#password" do
    it "returns password of user" do
      expect(user.password).to eq "password"
    end
  end

end
