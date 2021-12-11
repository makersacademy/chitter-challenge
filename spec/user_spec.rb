require 'user'

describe User do
  context ".create"
    it "creates a user" do
      user = User.create(email: "test@example.com", password: "1234")

      expect(user).to be_a User
      expect(user.email).to eq "test@example.com"
    end

    it "encrypts user password" do
      expect(BCrypt::Password).to receive(:create).with("1234")
      user = User.create(email: "test@example.com", password: "1234")
    end

  context ".find"
    it "finds a user by ID" do
      user = User.create(email: "test@example.com", password: "1234")
      result = User.find(id: user.id)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end

    it "returns nil if no id is given" do
      expect(User.find(id: nil)).to eq nil
    end

end
