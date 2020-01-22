require 'user'

describe User do

  describe ".create" do
    it "creates a new user" do
      user = User.create("test@example.com", "password123")

      expect(user).to be_a User
      expect(user.email).to eq "test@example.com"
    end
  end

  describe ".find" do
    it "find a user by ID" do
      user = User.create("test@example.com", "password123")
      result = User.find(user.id)

      expect(result.id).to eq (user.id)
      expect(result.email).to eq (user.email)
    end
  end

end
