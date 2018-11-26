require "user"

describe User do
  describe ".create" do
    it "creates a new user in the database" do

      user = User.create(username: "KirillZ", name: "Kirill", email: "kirill@makers.com", password: "12345")
      persisted_user = persisted_user(id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_user["id"]
      expect(user.username).to eq "KirillZ"
      expect(user.name).to eq "Kirill"
      expect(user.email).to eq "kirill@makers.com"
      expect(user.password).to eq "12345"
    end
  end
end
