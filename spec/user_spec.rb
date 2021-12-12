require "user"

describe User do
  context ".create" do
    it "creates a user" do
      user = User.create(email: "test@example.com", password: "1234", username: "Test", name: "Test Test")

      expect(user.email).to eq "test@example.com"
      expect(user.username).to eq "Test"
      expect(user.name).to eq "Test Test"
    end

    it "encrypts user password" do
      expect(BCrypt::Password).to receive(:create).with("1234")
      User.create(email: "test@example.com", password: "1234", username: "Test", name: "Test Test")
    end

    it "returns 1 if email not unique" do
      User.create(email: "test@example.com", password: "1234", username: "Test", name: "Test Test")
      expect(User.create(email: "test@example.com", password: "1234", username: "Test", name: "Test Test")).to eq 1
    end

    it "returns 2 if username not unique" do
      User.create(email: "test@example.com", password: "1234", username: "Test", name: "Test Test")
      expect(User.create(email: "test1234@example.com", password: "1234", username: "Test", name: "Test Test")).to eq 2
    end
  end

  context ".find" do
    it "finds a user by ID" do
      user = User.create(email: "test@example.com", password: "1234", username: "Test", name: "Test Test")
      result = User.find(id: user.id)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end

    it "returns nil if no id is given" do
      expect(User.find(id: nil)).to eq nil
    end
  end

  context ".authenticate" do
    it "returns a user if given correct email and password" do
      user = User.create(email: "test@example.com", password: "1234", username: "Test", name: "Test Test")
      authenticated_user = User.authenticate(email: "test@example.com", password: "1234")

      expect(authenticated_user.id).to eq user.id
    end

    it "returns nil if given an incorrect email" do
      User.create(email: "test@example.com", password: "1234", username: "Test", name: "Test Test")
      expect(User.authenticate(email: "test1111@example.com", password: "1234")).to eq nil
    end

    it "returns nil if given incorrect password" do
      User.create(email: "test@example.com", password: "1234", username: "Test", name: "Test Test")
      expect(User.authenticate(email: "test@example.com", password: "wrong_password")).to eq nil
    end
  end

end
