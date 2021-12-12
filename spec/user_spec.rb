require "user"

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

    it "returns 1 if email not unique" do
      User.create(email: "test@example.com", password: "1234")
      expect(User.create(email: "test@example.com", password: "1234")).to eq 1
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

    context ".authenticate"
    it "returns a user if given correct email and password" do
      user = User.create(email: "test@example.com", password: "1234")
      authenticated_user = User.authenticate(email: "test@example.com", password: "1234")

      expect(authenticated_user.id).to eq user.id
    end

    it "returns nil if given an incorrect email" do
      user = User.create(email: "test@example.com", password: "1234")
      expect(User.authenticate(email: "test1111@example.com", password: "1234")).to eq nil
    end

    it "returns nil if given incorrect password" do
      user = User.create(email: "test@example.com", password: "1234")
      expect(User.authenticate(email: "test@example.com", password: "wrong_password")).to eq nil

    end

end
