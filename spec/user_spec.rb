require "user"

describe User do
  context ".create"
    it "creates a user" do
      user = User.create(email: "test@example.com", password: "1234",username:"test")

      expect(user).to be_a User
      expect(user.email).to eq "test@example.com"
      expect(user.username).to eq "test"
    end

    it "encrypts user password" do
      expect(BCrypt::Password).to receive(:create).with("1234")
      user = User.create(email: "test@example.com", password: "1234",username:"test")
    end

    it "returns 1 if username not unique" do
      User.create(email: "test@example.com", password: "1234",username:"test")
      expect(User.create(email: "test123@example.com", password: "1234",username:"test")).to eq 2
    end

    it "returns 2 if email not unique" do
      User.create(email: "test@example.com", password: "1234",username:"test")
      expect(User.create(email: "test@example.com", password: "1234",username:"test123")).to eq 1
    end

  context ".find"
    it "finds a user by ID" do
      user = User.create(email: "test@example.com", password: "1234",username:"test")
      result = User.find(id: user.id)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
      expect(result.username).to eq user.username
    end

    it "returns nil if no id is given" do
      expect(User.find(id: nil)).to eq nil
    end

end
